class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :user_id, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
