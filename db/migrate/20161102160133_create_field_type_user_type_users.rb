class CreateFieldTypeUserTypeUsers < ActiveRecord::Migration
  def change
    create_table :field_type_user_type_users, id: false do |t|
      t.references :type_user, index: true, foreign_key: true
      t.references :field_type_user, index: true, foreign_key: true
    end
    add_index :field_type_user_type_users, [:type_user_id, :field_type_user_id], unique: true
  end
end
