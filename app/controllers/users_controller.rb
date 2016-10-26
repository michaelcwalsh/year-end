class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @albums = Album.all.order(:rating).reverse_order
  end
end
