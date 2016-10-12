class AddSellerIdToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :seller_id, :integer
  end
end
