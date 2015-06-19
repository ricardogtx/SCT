class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :drug_type
      t.string :effect
      t.string :description
      t.string :dependence_phisical
      t.string :dependence_physicological
      t.timestamps null: false
    end
  end
end
