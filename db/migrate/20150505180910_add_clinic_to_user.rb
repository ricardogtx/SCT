class AddClinicToUser < ActiveRecord::Migration
  def change
    add_reference :clinics, :user, :index => true
  end
end
