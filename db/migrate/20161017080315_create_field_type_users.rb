class CreateFieldTypeUsers < ActiveRecord::Migration
  def change
    create_table :field_type_users do |t|
      t.integer :type_user_id
      t.string :name
    end
  end
end
