class AddEncryptedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :string, :string
    add_column :users, :encrypted_password, :string
  end
end
