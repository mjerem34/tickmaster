class CreateMaterialsDetentors < ActiveRecord::Migration
  def change
    create_table :materials_detentors do |t|
      t.integer :material_id
      t.integer :detentor_type_id
      t.integer :detentor_id
      t.date :date

      t.timestamps null: false
    end
  end
end
