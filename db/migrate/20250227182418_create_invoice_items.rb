class CreateInvoiceItems < ActiveRecord::Migration[8.0]
  def change
    create_table :invoice_items do |t|
      t.belongs_to :invoice, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.string :product_name
      t.integer :quantity
      t.decimal :price
      t.decimal :total
      t.timestamps
    end
  end
end
