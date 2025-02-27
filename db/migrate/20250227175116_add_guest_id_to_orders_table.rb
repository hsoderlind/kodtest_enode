class AddGuestIdToOrdersTable < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :guest_id, :integer, null: true
    change_column_null :orders, :customer_id, true
  end
end
