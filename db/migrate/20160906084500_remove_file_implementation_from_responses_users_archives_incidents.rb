class RemoveFileImplementationFromResponsesUsersArchivesIncidents < ActiveRecord::Migration
  def change
    remove_column :users, :attach_file_name, :integer
    remove_column :users, :attach_content_type, :integer
    remove_column :users, :attach_file_size, :integer
    remove_column :users, :attach_updated_at, :integer

    remove_column :responses, :attach_file_name, :integer
    remove_column :responses, :attach_content_type, :integer
    remove_column :responses, :attach_file_size, :integer
    remove_column :responses, :attach_updated_at, :integer

    remove_column :archives, :attach_file_name, :integer
    remove_column :archives, :attach_content_type, :integer
    remove_column :archives, :attach_file_size, :integer
    remove_column :archives, :attach_updated_at, :integer

    remove_column :incidents, :attach_file_name, :integer
    remove_column :incidents, :attach_content_type, :integer
    remove_column :incidents, :attach_file_size, :integer
    remove_column :incidents, :attach_updated_at, :integer
  end
end
