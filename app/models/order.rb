class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :order_items
  has_one :invoice
  validates :subtotal, presence: true
  validates :total, presence: true

  def generate_invoice
    return nil unless customer

    invoice = Invoice.create!(
      customer: customer,
      customer_name: customer.name,
      order: self,
      subtotal: subtotal,
      total: total,
      discount: discount
    )

    order_items.each do |order_item|
      invoice.invoice_items.create!(
        product_id: order_item.product_id,
        product_name: Product.find(order_item.product_id).name,
        quantity: order_item.quantity,
        price: order_item.price,
        total: order_item.total
      )
    end

    invoice
  end
end
