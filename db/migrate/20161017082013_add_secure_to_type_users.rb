class AddSecureToTypeUsers < ActiveRecord::Migration
  def change
    add_column :type_users, :secure, :boolean
  end
end
