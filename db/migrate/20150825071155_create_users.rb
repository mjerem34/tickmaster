class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pseudo, limit: 50, unique: true
      t.string :email, limit: 50, unique: true
      t.string :tel, limit: 30
      t.string :mobile, limit: 15
      t.string :name, limit: 20
      t.string :surname, limit: 20
      t.string :password
      t.string :salt
      t.references :tech, index: true
      t.references :agency, index: true

      t.timestamps null: false
    end
  end
end
