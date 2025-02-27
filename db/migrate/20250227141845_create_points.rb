class CreatePoints < ActiveRecord::Migration[8.0]
  def change
    create_table :points do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :order, null: true, foreign_key: true
      t.integer :allocated_points
      t.integer :used_points, null: true

      t.timestamps
    end
  end
end
