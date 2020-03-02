class SnailsController < ApplicationController

    before_action :find_snail_by_id, only: [:show, :edit, :update, :destroy]

    def index
        @snails = Snail.all
    end

    def new
        @snail = Snail.new
        @shells = Shell.all
        @bodies = Body.all
        @foods = Prize.all
    end

    def create
        @snail = Snail.create(snail_params)
        if @snail.valid?
            redirect_to @snail
        else
            flash[:errors] = @snail.errors.full_messages
            redirect_to new_snail_path
        end
    end

    def update
        
    end

    def destroy
        @snail.destroy
        redirect_to snails_path
    end

    private

    def find_snail_by_id
        @snail = Snail.find(params[:id])
    end

    def snail_params
        params.require(:snail).permit(:name, :shell_id, :body_id, :favorite_food)
    end
end
