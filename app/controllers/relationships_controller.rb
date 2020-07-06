class RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    p request.referrer
    redirect_to request.referrer
  end

  def unfollow
    current_user.unfollow(params[:id])
    p request.referrer
    redirect_to request.referrer
  end

  def following
    @user = User.find(params[:user_id])
  end

  def follower
    @user = User.find(params[:user_id])
  end
end
