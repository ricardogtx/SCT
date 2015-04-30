class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :type
      t.string :origin
      t.string :average_ingest
      t.string :ingestion_form
      t.string :effect_average
      t.string :effect_high
      t.string :dependence_psychological
      t.string :dependence_phisical
      t.string :tolerance
      t.string :high_term
      t.string :long_effects
      t.string :medical_use
      t.timestamps null: false
    end
  end
end
