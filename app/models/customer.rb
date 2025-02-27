class Customer < ApplicationRecord
  has_one :cart
  has_many :points
  has_many :orders
  has_secure_password
  validates :password, presence: true
  validates :name, presence: true

  # This tells you if current_customer is a registered customer or guest.
  def registered?
    true
  end

  def get_cart
    cart || Cart.create(user: self)
  end
end
