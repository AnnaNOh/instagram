class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if @user
      login(@user)
      render "api/users/show"
    else
      render json: ["Sorry, your password was incorrect. Please double-check your password."], status: 401
    end
  end

  def destroy
    @user = current_user
    if @user
      logout
      render "api/users/show"
    else
      render json: ["No one was signed in"], status: 404
    end
  end

end
