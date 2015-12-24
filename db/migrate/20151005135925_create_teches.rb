class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :name, limit: 40
      t.boolean :afficher
      t.boolean :simple_user
      t.timestamps null: false
    end
  end
end
