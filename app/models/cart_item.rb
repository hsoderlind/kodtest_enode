class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :product_id, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
  validates :total, numericality: { greater_than: 0 }
  validate :total_must_match_price_times_quantity

  private
    def total_must_match_price_times_quantity
      expected_total = price * quantity
      if total != expected_total
        errors.add(:total, "must be equal to price * quantity (#{expected_total})")
      end
    end
end
