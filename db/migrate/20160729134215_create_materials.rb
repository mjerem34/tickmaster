class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :type_material_id
      t.integer :detentor_type_id
      t.integer :detentor_id
      t.integer :seller_id
      t.datetime :date

      t.timestamps null: false
    end
  end
end
