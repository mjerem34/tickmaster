class CreateSpecMaterialMaterials < ActiveRecord::Migration
  def change
    create_table :spec_material_materials, id: false do |t|
      t.integer :specs_material_id
      t.integer :material_id
    end
    add_index :spec_material_materials, [:specs_material_id, :material_id], unique: true
  end
end
