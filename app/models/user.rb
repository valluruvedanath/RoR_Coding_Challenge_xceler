class User < ApplicationRecord
  validates :email, :presence => true, :uniqueness => true
  has_many :event_subscriptions
  has_secure_password
end
