class RacesController < ApplicationController

    def index
        @races = Race.all
    end

    def show
    end
end
