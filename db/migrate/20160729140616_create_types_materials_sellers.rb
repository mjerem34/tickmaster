class CreateTypeMaterialSellers < ActiveRecord::Migration
  def change
    create_table :type_material_sellers, id: false do |t|
      t.integer :type_material_id
      t.integer :seller_id
    end
    add_index :type_material_sellers, [:type_material_id, :seller_id], unique: true
  end
end
