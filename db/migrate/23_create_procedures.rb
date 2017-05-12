class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :nom, null: false
      t.text :contenu, null: false
      t.text :resolution, null: false
      t.references :category, null: false, index: true, foreign_key: true
      t.references :sous_category, null: false, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
