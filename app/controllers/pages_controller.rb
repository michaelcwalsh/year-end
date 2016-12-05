class PagesController < ApplicationController
  def show
    if user_signed_in?
      feed_items = []
      current_user.following_ids.each do |id|
        feed_items << Album.where(user_id: id)
      end
      @albums = []
      feed_items.each do |following|
        following.each do |album|
          @albums << album
        end
      end
      @albums.sort! { |a,b| b.created_at <=> a.created_at }
    end
    render template: "pages/#{params[:page]}"
  end
end
