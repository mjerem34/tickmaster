class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name, unique: true, null: false
      t.boolean :actif, null: false
      t.datetime :created_at, null: false
    end
  end
end
