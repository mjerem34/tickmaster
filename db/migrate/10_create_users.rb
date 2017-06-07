class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :tel, null: false
      t.string :crypted_password, null: false
      t.string :password_salt, null: false
      t.string :persistence_token, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.references :type_user, index: true, foreign_key: true, null: false
      t.references :agency, index: true, foreign_key: true, null: false
      t.string :ip_addr, null: false
      t.boolean :actif, null: false, default: 1
      t.timestamps null: false
    end
  end
end
