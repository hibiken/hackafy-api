class Post < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
