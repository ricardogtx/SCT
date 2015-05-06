class AddLevelUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :level_user, :intenger
  end
end
