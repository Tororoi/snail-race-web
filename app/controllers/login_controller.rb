class LoginController < ApplicationController
    # skip_before_action :authenticate!

    def index
    end
  
    def create
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password]) 
        session[:user_id] = @user.id
        redirect_to new_snail_path
      else
        flash[:errors] = ["name or password did not match"]
        redirect_to login_index_path
      end
    end
  
    def destroy
      
      session[:user_id] = nil
      flash[:notification] = "You have been logged out"
      redirect_to login_index_path
    end

end
