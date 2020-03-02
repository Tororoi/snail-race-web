class UsersController < ApplicationController

    before_action :find_user_by_id, only: [:show, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_snail_path
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path #change to welcome page
    end

    private

    def find_user_by_id
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :money)
    end
end
