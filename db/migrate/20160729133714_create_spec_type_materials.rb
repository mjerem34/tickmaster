class CreateSpecTypeMaterials < ActiveRecord::Migration
  def change
    create_table :spec_type_materials do |t|
      t.string :name, unique: true, null: false
    end
  end
end
