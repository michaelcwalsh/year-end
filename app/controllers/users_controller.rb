class UsersController < ApplicationController
  before_action :authorize_user

  def show
    @user = User.find(params[:id])
    @users = User.all
    @my_albums = Album.my_albums(@user)
  end

  protected

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in or sign up."
      redirect_to root_path
    end
  end
end
