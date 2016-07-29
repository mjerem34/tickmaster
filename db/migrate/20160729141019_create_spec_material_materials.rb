class CreateSpecMaterialMaterials < ActiveRecord::Migration
  def change
    create_table :spec_material_materials do |t|
      t.integer :spec_material_id
      t.integer :material_id
    end
  end
end
