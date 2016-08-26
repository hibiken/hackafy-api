class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  scope :get_page, -> (page) { includes(:user).order(created_at: :desc).paginate(page: page, per_page: 3) }
end
