class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A@\z/
  validates :password_digest, presence: true
  has_secure_password
end
