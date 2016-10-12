class AddDetentorTypeIdAndDetentorIdToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :detentor_type_id, :integer
    add_column :materials, :detentor_id, :integer
  end
end
