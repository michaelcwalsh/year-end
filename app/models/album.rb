class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  validates :rating, presence: true

  belongs_to :user
  mount_uploader :art, ArtUploader

  def self.my_albums(user)
    albums = Album.all.order(:rating).reverse_order
    my_album_array = []
    albums.each do |album|
      if album.user_id == user.id
        my_album_array << album
      end
    end
    my_album_array
  end
end
