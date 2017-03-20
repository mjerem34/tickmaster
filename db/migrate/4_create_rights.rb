class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.string :name, null: false, unique: true
      t.string :content, null: false, unique: true
    end
  end
end
