class CreateFieldTypeUserTypeUsers < ActiveRecord::Migration
  def change
    create_table :field_type_user_type_users do |t|
      t.integer :type_user_id
      t.integer :field_type_user_id
      t.boolean :display_in_list
    end
  end
end
