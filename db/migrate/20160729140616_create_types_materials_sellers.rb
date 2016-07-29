class CreateTypesMaterialsSellers < ActiveRecord::Migration
  def change
    create_table :types_materials_sellers do |t|
      t.integer :type_material_id
      t.integer :seller_id
    end
  end
end
