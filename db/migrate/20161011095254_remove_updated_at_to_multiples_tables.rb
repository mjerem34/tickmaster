class RemoveUpdatedAtToMultiplesTables < ActiveRecord::Migration
  def change
    remove_column :updates, :updated_at, :datetime
    remove_column :specs_materials, :updated_at, :datetime
    remove_column :detentor_types, :updated_at, :datetime
    remove_column :fields_sellers, :updated_at, :datetime
    remove_column :sellers, :updated_at, :datetime
    remove_column :type_materials, :updated_at, :datetime

    remove_column :specs_materials, :created_at, :datetime
    remove_column :detentor_types, :created_at, :datetime
    remove_column :fields_sellers, :created_at, :datetime
    remove_column :type_materials, :created_at, :datetime
  end
end
