class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :username, uniqueness: true, presence: true
   validates :name, presence: true
   validates :email, uniqueness: true, presence: true
   validates :password, presence: true
   mount_uploader :avatar, AvatarUploader
end
