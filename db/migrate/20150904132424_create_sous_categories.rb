class CreateSousCategories < ActiveRecord::Migration
  def change
    create_table :sous_categories do |t|
      t.string :name, limit: 30
      t.integer :category_id, limit: 2
      t.integer :lvl_urgence_max, limit: 2
      t.references :category, index: true #category_id

      t.timestamps null: false
    end
  end
end
