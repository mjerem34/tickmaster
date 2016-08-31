class RemoveAgencyFromIncidents < ActiveRecord::Migration
  def change
    remove_column :incidents, :agency_id, :integer
  end
end
