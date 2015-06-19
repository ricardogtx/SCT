class AddAttachmentAvatarToDrugs < ActiveRecord::Migration
  def self.up
    change_table :drugs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :drugs, :avatar
  end
end
