class UsersController < ApplicationController
  before_action :authorize_user

  def show
    @user = User.find(params[:id])
    @users = User.all
    @albums = Album.all.order(:rating).reverse_order
    @my_albums = []
    @albums.each do |album|
      if album.user_id == @user.id
        @my_albums << album
      end
    end
  end

  protected

  def authorize_user
    unless user_signed_in?
      flash[:notice] = "Please sign in or sign up."
      redirect_to root_path
    end
  end
end
