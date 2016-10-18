class AddIsTechToTypeUsers < ActiveRecord::Migration
  def change
    add_column :type_users, :is_tech, :boolean
  end
end
