class CreateTypesMaterialsSpecMaterials < ActiveRecord::Migration
  def change
    create_table :type_materials_specs_types_materials, id: false do |t|
      t.integer :type_material_id
      t.integer :specs_types_material_id
    end
    add_index :type_materials_specs_types_materials, [:type_material_id, :specs_types_material_id], unique: true
  end
end
