class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pseudo, unique: true, null: false
      t.string :email, unique: true, null: false
      t.string :tel, null: false
      t.string :password, null: false
      t.string :salt, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.references :type_user, index: true, foreign_key: true, null: false
      t.references :agency, index: true, foreign_key: true, null: false
      t.string :ip_addr, null: false
      t.datetime :sys_msg, null: false
      t.boolean :actif, null: false
      t.datetime :maj, null: false
      t.timestamps null: false
    end
  end
end
