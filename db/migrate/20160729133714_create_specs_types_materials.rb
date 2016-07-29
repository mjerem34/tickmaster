class CreateSpecsTypesMaterials < ActiveRecord::Migration
  def change
    create_table :specs_types_materials do |t|
      t.string :name
    end
  end
end
