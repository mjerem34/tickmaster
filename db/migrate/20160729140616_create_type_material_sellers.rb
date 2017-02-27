class CreateTypeMaterialSellers < ActiveRecord::Migration
  def change
    create_table :type_material_sellers, id: false do |t|
      t.references :type_material, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
    end
    add_index :type_material_sellers, [:type_material_id, :seller_id], unique: true
  end
end
