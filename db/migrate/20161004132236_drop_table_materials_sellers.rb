class DropTableMaterialsSellers < ActiveRecord::Migration
  def change
    drop_table :materials_sellers
  end
end
