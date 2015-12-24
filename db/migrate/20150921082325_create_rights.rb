class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.string :name
      t.string :content
      t.boolean :user
      t.boolean :tech
      t.boolean :super_tech
      t.boolean :admin
      t.boolean :disp
      t.boolean :assistant
      t.boolean :expert
      t.boolean :comptable
    end
  end
end
