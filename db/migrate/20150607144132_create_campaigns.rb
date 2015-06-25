class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :url
      t.string :description

      t.timestamps null: false
    end
  end
end