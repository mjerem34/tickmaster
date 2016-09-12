class ModifyTableTypeMaterialsSpecsTypesMaterials < ActiveRecord::Migration
  def change
    rename_table :types_materials_spec_materials, :type_materials_specs_types_materials
    rename_column :type_materials_specs_types_materials, :spec_material_id, :spec_type_material_id
  end
end
