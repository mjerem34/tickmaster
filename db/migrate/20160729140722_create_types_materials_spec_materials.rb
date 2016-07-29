class CreateTypesMaterialsSpecMaterials < ActiveRecord::Migration
  def change
    create_table :types_materials_spec_materials do |t|
      t.integer :type_material_id
      t.integer :spec_material_id
    end
  end
end
