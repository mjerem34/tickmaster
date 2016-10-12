class RemoveModeNuitJourToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :mode, :boolean
  end
end
