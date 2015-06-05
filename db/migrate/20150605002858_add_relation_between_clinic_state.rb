class AddRelationBetweenClinicState < ActiveRecord::Migration
  def up
    remove_column :clinics, :estado
    add_reference :clinics, :state, index: true
  end

  def down
    remove_column :clinics, :state_id
    add_column :clinics, :estado, :string
  end
end
