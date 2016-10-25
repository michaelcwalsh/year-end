class AlbumsController < ApplicationController
  def new
    @album = Album.new
    albums_json = { "title": @album.title, "artist": @album.artist }
    respond_to do |format|
      format.html
      format.json { render json: albums_json }
    end
  end

  def create
  end
end
