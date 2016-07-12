class AddNotifyForTechToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :notify_for_tech, :boolean
  end
end
