class RemoveMultiplesFieldsFromMaterials < ActiveRecord::Migration
  def change
    remove_column :materials, :detentor_type_id, :integer
    remove_column :materials, :detentor_id, :integer
    remove_column :materials, :seller_id, :integer
    remove_column :materials, :date, :date
  end
end
