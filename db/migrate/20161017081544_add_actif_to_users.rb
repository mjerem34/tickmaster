class AddActifToUsers < ActiveRecord::Migration
  def change
    add_column :users, :actif, :boolean
  end
end
