class ChangeColumnGuestIdToStringOnOrdersTable < ActiveRecord::Migration[8.0]
  def change
    change_column :orders, :guest_id, :string
  end
end
