class AddDisplayInListToFieldTypeUsers < ActiveRecord::Migration
  def change
    add_column :field_type_users, :display_in_list, :boolean
  end
end
