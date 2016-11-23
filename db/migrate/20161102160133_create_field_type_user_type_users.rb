class CreateFieldTypeUserTypeUsers < ActiveRecord::Migration
  def change
    create_table :field_type_user_type_users, id: false do |t|
      t.integer :type_user_id
      t.integer :field_type_user_id
    end
    add_index :field_type_user_type_users, [:type_user_id, :field_type_user_id], unique: true
  end
end
