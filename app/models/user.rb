class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :FullName, presence: true, length: {maximum: 150}
  validates :UserName, presence: true, length: {maximum: 20}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :Email, length: {maximum: 150}, :allow_blank => true, format: {with: VALID_EMAIL_REGEX}
  has_secure_password
end
