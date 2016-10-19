class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  validates :year, presence: true
  validates :rank, presence: true

  belongs_to :user
end
