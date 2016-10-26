class AlbumsController < ApplicationController
  require 'httparty'
  def show
    @album = Album.new
    @id = params[:id]
    @result = HTTParty.get('https://api.spotify.com/v1/albums/' + @id)
    @album.id = @result["id"]
    @album.art = @result["images"][1]["url"]
    @album.title = @result["name"]
    @album.artist = @result["artists"][0]["name"]
  end

  def new
    # @album = Album.new(album_params)
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    binding.pry
    if @album.save
      @album.save
      redirect_to albums_path
      flash[:notice] = "Added to list"
    else
      render :new
    end
  end

  def index
    @albums = Album.all.order(:rating)
  end

  private

  def album_params
    params.require(:album).permit(
      :id,
      :user_id,
      :title,
      :artist,
      :rating,
      :art,
      :notes,
    )
  end
end
