class CreateSpecMaterials < ActiveRecord::Migration
  def change
    create_table :spec_materials do |t|
      t.references :spec_type_material, index: true, foreign_key: true, null: false
      t.string :spec_value, null: false, unique: true
    end
  end
end
