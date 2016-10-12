class DropTableMaterialsDetentors < ActiveRecord::Migration
  def change
    drop_table :materials_detentors
  end
end
