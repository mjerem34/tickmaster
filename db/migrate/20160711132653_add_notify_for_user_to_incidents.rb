class AddNotifyForUserToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :notify_for_user, :boolean
  end
end
