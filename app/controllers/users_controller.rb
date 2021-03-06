class UsersController < ApplicationController
    # skip_before_action :authenticate!

    before_action :find_user_by_id, only: [:show, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def update
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
        @user.destroy
        redirect_to users_path #change to welcome page
    end

    private

    def find_user_by_id
        @user = User.find(session[:user_id])
    end

    def user_params
        params.require(:user).permit(:name, :money, :password)
    end
end
