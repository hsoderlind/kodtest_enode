class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.belongs_to :customer, null: true, foreign_key: true
      t.string :guest_id, null: true

      t.timestamps
    end
    add_index :carts, :guest_id
  end
end
