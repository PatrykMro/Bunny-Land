class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites

  validates :text, presence: true, length: {maximum: 140}

  def favorited?(any_user)
    users.include?(any_user)
  end

end
