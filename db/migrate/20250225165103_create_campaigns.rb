class CreateCampaigns < ActiveRecord::Migration[8.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :points
      t.integer "category_id"
      t.index [ "category_id" ], name: "index_campaigns_on_category_id"

      t.timestamps
    end
  end
end
