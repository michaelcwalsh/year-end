class AlbumsController < ApplicationController
  require 'httparty'
  def show
    @album = Album.new
    @id = params[:id]
    @result = HTTParty.get('https://api.spotify.com/v1/albums/' + @id)
    @album.id = @result["id"]
    @album.spotify_art = @result["images"][1]["url"]
    @album.title = @result["name"]
    @album.artist = @result["artists"][0]["name"]
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      @album.save
      redirect_to user_path(current_user.id)
      flash[:notice] = "Added to list"
    else
      if @album.spotify_art.nil?
        @errors = @album.errors.full_messages.join(" // ")
        flash[:alert] = @errors
        render :new
      else
        flash[:alert] = "Rating cannot be blank"
        render :show
      end
    end
  end

  private

  def album_params
    params.require(:album).permit(
      :id,
      :user_id,
      :title,
      :artist,
      :rating,
      :spotify_art,
      :art,
      :notes,
      :remote_art_url
    )
  end
end
