class CreateTypeMaterials < ActiveRecord::Migration
  def change
    create_table :type_materials do |t|
      t.string :name, unique: true, null: false
    end
  end
end
