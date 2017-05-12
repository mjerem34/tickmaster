class CreateFieldTypeUserTypeUsers < ActiveRecord::Migration
  def change
    create_table :field_type_user_type_users do |t|
      t.references :type_user, index: true, foreign_key: true
      t.references :field_type_user, index: true, foreign_key: true
    end
  end
end
