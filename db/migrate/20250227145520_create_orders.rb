class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.decimal :subtotal
      t.decimal :discount, null: true
      t.decimal :total
      t.timestamps
    end
  end
end
