class CreateTypesMaterialsSellers < ActiveRecord::Migration
  def change
    create_table :types_materials_sellers, id: false do |t|
      t.integer :type_material_id
      t.integer :seller_id
    end
    add_index :types_materials_sellers, [:type_material_id, :seller_id], unique: true
  end
end
