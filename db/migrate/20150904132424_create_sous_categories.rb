class CreateSousCategories < ActiveRecord::Migration
  def change
    create_table :sous_categories do |t|
      t.string :name, unique: true, null: false
      t.references :category, index: true, foreign_key: true, null: false
      t.integer :lvl_urgence_max, limit: 2, null: false
    end
  end
end
