class CreateMaterialsSellers < ActiveRecord::Migration
  def change
    create_table :materials_sellers do |t|
      t.integer :material_id
      t.integer :seller_id

      t.timestamps null: false
    end
  end
end
