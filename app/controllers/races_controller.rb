class RacesController < ApplicationController

    before_action :find_race_by_id, only: [:show]

    def index
        @races = Race.all
    end

    def new
        @race = Race.new
        @snails = Snail.all
    end

    def show
        @bet = Bet.new
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
