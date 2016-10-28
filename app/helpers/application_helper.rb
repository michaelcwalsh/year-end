module ApplicationHelper
  require 'httparty'

  def embed(artist, title)
    response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{artist}%20#{title}&type=video&key=#{ENV["YOUTUBE_API_KEY"]}")
    youtube_id = response["items"][0]["id"]["videoId"]
    @video = content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
    return @video
  end
end
