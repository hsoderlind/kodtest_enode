class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :order_items
  validates :subtotal, presence: true
  validates :total, presence: true
end
