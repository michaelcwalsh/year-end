class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :username, uniqueness: true, presence: true
   validates :name, presence: true
   validates :email, uniqueness: true, presence: true
   validates :password, presence: true
   mount_uploader :avatar, AvatarUploader

   has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

end
