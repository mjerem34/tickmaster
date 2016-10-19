class RemoveDisplayInListFromFieldTypeUsers < ActiveRecord::Migration
  def change
    remove_column :field_type_users, :display_in_list, :boolean
    remove_column :field_type_users, :type_user_id, :integer
  end
end
