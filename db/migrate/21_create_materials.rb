class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :type_material, index: true, foreign_key: true, null: false
      t.references :detentor_type, index: true, foreign_key: true, null: false
      t.references :detentor, index: true, null: false
      t.references :seller, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
