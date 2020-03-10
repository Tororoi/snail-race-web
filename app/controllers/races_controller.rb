class RacesController < ApplicationController

    before_action :find_race_by_id, only: [:show, :run]

    def index
        @races = Race.all
    end

    def new
        @race = Race.new
        @snails = Snail.all
    end

    def run
        @lane_one = @race.snail_races.first
        @lane_two = @race.snail_races.second
        @lane_three = @race.snail_races.third
        @lane_four = @race.snail_races.fourth

        @timers = [@lane_one.snail.speed(@race),@lane_two.snail.speed(@race),@lane_three.snail.speed(@race),@lane_four.snail.speed(@race)]
        @ranks = @timers.sort
        @lane_one.update(rank: @ranks.index(@timers[0])+1)
        @lane_two.update(rank: @ranks.index(@timers[1])+1)
        @lane_three.update(rank: @ranks.index(@timers[2])+1)
        @lane_four.update(rank: @ranks.index(@timers[3])+1)
        @winner = SnailRace.find_by(race_id: @race.id, rank: 1)
        @payout = @winner.bets.inject(0){|sum,x| sum + x.amount }*4
        @payee = User.find(session[:user_id])
        @payee.update(money: @payee.money+=@payout)
    end

    def show
        @bet = Bet.new
        @bets = @race.bets.where(user_id: session[:user_id])
    end

    def create
        @race = Race.create(race_params)
        if @race.valid?
            redirect_to @race
        else
            flash[:errors] = @race.errors.full_messages
            redirect_to new_race_path
        end
    end

    private

    def find_race_by_id
        @race = Race.find(params[:id])
    end

    def race_params
        params.require(:race).permit(:name, :prize_id)
    end
end
