class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  validates :rating, presence: true

  belongs_to :user
  mount_uploader :art, ArtUploader
end
