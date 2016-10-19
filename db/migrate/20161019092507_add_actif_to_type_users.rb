class AddActifToTypeUsers < ActiveRecord::Migration
  def change
    add_column :type_users, :actif, :boolean
  end
end
