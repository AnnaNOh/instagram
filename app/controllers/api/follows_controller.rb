class Api::FollowsController < ApplicationController

  def create
    @follow = Follow.new
    @follow.following_id = params[:id]
    @follow.followers_id = current_user.id

    unless @follow.save
      flash[:errors] = @follow.errors.full_messages
    end
    redirect_to user_url(params[:id])
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to user_url(@follow.following_id)
  end

  def show
    @user = User.find_by_username(params[:username])

  end

end
