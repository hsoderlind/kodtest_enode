class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :order
  has_many :invoice_items
end
