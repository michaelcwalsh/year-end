class AlbumsController < ApplicationController
  require 'httparty'
  def show
    @album = Album.new
    @id = params[:id]
    result = HTTParty.get('https://api.spotify.com/v1/albums/' + @id)
    @album.art = result["images"][1]["url"]
    @album.title = result["name"]
    @album.artist = result["artists"][0]["name"]
  end

  def new
    @album = Album.new
  end

  def create
  end

  private

  def album_params
    params.require(:album).permit(
      :id,
      :user_id,
      :title,
      :artist,
      :year,
      :rank,
      :art,
      :notes,
      :blurb,
      :artists
    )
  end
end
