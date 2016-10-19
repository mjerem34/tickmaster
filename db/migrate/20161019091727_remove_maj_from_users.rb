class RemoveMajFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :maj, :boolean
  end
end
