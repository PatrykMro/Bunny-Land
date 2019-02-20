class User < ApplicationRecord
  attr_accessor :avatar, :avatar_cache, :remove_avatar

  mount_uploader :avatar, AvatarUploader
  mount_uploader :background_picture, BackgroundPictureUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :posts

  def should_generate_new_friendly_id?
    slug.blank? || username_changed?
  end
end
