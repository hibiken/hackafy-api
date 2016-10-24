class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :user_id, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  scope :get_page, -> (page, per_page = 10) {
    includes(:user, :comments).order(created_at: :desc).paginate(page: page, per_page: per_page)
  }
end
