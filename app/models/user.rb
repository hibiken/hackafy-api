class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: EMAIL_REGEX }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
