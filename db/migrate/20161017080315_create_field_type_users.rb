class CreateFieldTypeUsers < ActiveRecord::Migration
  def change
    create_table :field_type_users do |t|
      t.string :name, unique: true, null: false
    end
  end
end
