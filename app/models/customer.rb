class Customer < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  validates :name, presence: true
end
