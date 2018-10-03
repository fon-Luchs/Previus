class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_one :auth_token, dependent: :destroy
  has_many :discussion
end
