class CreateSpecsMaterials < ActiveRecord::Migration
  def change
    create_table :specs_materials do |t|
      t.integer :spec_type_material_id
      t.string :spec_value
    end
  end
end
