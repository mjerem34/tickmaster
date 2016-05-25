class AddModeNuitJourToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mode, :string
  end
end
