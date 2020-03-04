class SnailRacesController < ApplicationController

    def create
        @snail_race = SnailRace.create(snail_race_params)
        @snail = @snail_race.snail
        @race = @snail_race.race
        if @snail_race.valid?
            redirect_to @race
        else
            flash[:errors] = @snail_race.errors.full_messages
            redirect_to snail_path(@snail)
        end
    end

private

    def snail_race_params
        params.require(:snail_race).permit(:snail_id, :race_id)
    end
end
