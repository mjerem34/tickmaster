class CreateSpecMaterialMaterials < ActiveRecord::Migration
  def change
    create_table :spec_material_materials, id: false do |t|
      t.references :spec_material, index: true, foreign_key: true
      t.references :material, index: true, foreign_key: true
    end
  end
end
