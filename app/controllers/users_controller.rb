class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @albums = Album.all.order(:rating).reverse_order
  end
end
