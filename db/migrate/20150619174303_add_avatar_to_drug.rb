class AddAvatarToDrug < ActiveRecord::Migration
  def up
    add_attachment :drugs, :avatar
  end

  def down
    remove_attachment :drugs, :avatar
  end
end
