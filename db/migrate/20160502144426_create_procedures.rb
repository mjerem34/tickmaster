class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :nom
      t.text :contenu
      t.text :resolution
      t.integer :category_id
      t.integer :sous_category_id

      t.timestamps null: false
    end
  end
end
