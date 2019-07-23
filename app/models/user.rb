class User < ApplicationRecord
  has_many :posts
  has_secure_password
  before_create :assign_remember_token

  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true

  private

  def assign_remember_token
    token = SecureRandom.urlsafe_base64
    self.remember_token = Digest::SHA1.hexdigest(token.to_s)
  end
end
