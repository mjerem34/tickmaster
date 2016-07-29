class CreateTypeMaterials < ActiveRecord::Migration
  def change
    create_table :type_materials do |t|
      t.string :name
    end
  end
end
