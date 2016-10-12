class AddActifToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :actif, :boolean
  end
end
