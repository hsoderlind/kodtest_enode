class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true
      t.string :customer_name
      t.decimal :subtotal
      t.decimal :discount, null: true
      t.decimal :total
      t.timestamps
    end
  end
end
