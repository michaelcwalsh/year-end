class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :username, uniqueness: true, presence: true
   validates :name, presence: true
   validates :email, uniqueness: true, presence: true
   validates :password, presence: true
   mount_uploader :avatar, AvatarUploader

   has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
   has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

   has_many :following, through: :active_relationships, source: :followed
   has_many :followers, through: :passive_relationships, source: :follower

   def feed
   end

   def follow(other_user)
     active_relationships.create(followed_id: other_user.id)
   end

   def unfollow(other_user)
     active_relationships.find_by(followed_id: other_user.id).destroy
   end

   def following?(other_user)
     following.include?(other_user)
   end
end
