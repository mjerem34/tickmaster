class CreateTypeMaterialSellers < ActiveRecord::Migration
  def change
    create_table :type_material_sellers do |t|
      t.references :type_material, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
    end
  end
end
