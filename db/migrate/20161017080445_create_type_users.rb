class CreateTypeUsers < ActiveRecord::Migration
  def change
    create_table :type_users do |t|
      t.string :name, null: false, unique: true
      t.boolean :secure, null: false
      t.boolean :is_tech, null: false
      t.boolean :actif, null: false
    end
  end
end
