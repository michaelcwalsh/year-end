class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
    flash[:notice] = "You are now following #{user.username}"
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end
