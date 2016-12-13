class CreateTypeMaterialSpecMaterials < ActiveRecord::Migration
  def change
    create_table :type_material_spec_types_materials, id: false do |t|
      t.references :type_material, index: true, foreign_key: true
      t.references :spec_type_material, index: true, foreign_key: true
    end
    add_index :type_material_spec_type_materials, [:type_material_id, :spec_type_material_id], unique: true
  end
end
