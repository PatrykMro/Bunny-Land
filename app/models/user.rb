class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :posts

  #attr_accessible :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar

  def should_generate_new_friendly_id?
    slug.blank? || username_changed?
  end
end
