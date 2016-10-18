class DropUserTechSuperTechAdminDispAssistantExpertComptableFromRights < ActiveRecord::Migration
  def change
    remove_column :rights, :user, :boolean
    remove_column :rights, :tech, :boolean
    remove_column :rights, :super_tech, :boolean
    remove_column :rights, :admin, :boolean
    remove_column :rights, :disp, :boolean
    remove_column :rights, :assistant, :boolean
    remove_column :rights, :expert, :boolean
    remove_column :rights, :comptable, :boolean
  end
end
