class CreateFieldTypeUserTypeUsers < ActiveRecord::Migration
  def change
    create_table :field_type_user_type_users do |t|
      t.integer :type_user_id
      t.integer :field_type_user_id

      t.timestamps null: false
    end
  end
end
