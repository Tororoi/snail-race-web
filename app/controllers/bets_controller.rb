class BetsController < ApplicationController
    
    
    
    def create
        @bet = Bet.create(bet_params)
        @user = User.find(session[:user_id])
        @user.update(money: @user.money-=1)
        if @bet.valid?
            redirect_to @bet.snail_race.race
        else
            flash[:errors] = @bet.errors.full_messages
            redirect_to @bet.snail_race.race
        end
    end

    def destroy
        @bet = Bet.find(params[:id])
        @race = @bet.snail_race.race
        @bet.destroy
        redirect_to @race
    end


    private 

    def bet_params
        params.require(:bet).permit(:snail_race_id, :user_id, :amount)
    end
end
