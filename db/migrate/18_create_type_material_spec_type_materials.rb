class CreateTypeMaterialSpecTypeMaterials < ActiveRecord::Migration
  def change
    create_table :type_material_spec_type_materials do |t|
      t.references :type_material, index: true, foreign_key: true
      t.references :spec_type_material, index: true, foreign_key: true
    end
  end
end
