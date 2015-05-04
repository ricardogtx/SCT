class AddClinicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :clinic, :integer
  end
end
