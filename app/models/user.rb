class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship",
            foreign_key: "followed_id",
            dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :notifications, dependent: :destroy, foreign_key: :recipient_id

  has_secure_password
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: EMAIL_REGEX }
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { in: 2..30 }
  validates :password, length: { minimum: 8 }

  mount_uploader :avatar, AvatarUploader

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end

  def like!(post)
    likes.where(post_id: post.id).first_or_create!
  end

  def dislike!(post)
    likes.where(post_id: post.id).destroy_all
  end

  def follow(other_user)
    return false if self.id == other_user.id
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following_ids.include?(other_user.id)
  end
end
