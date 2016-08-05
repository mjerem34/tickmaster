class AddMajToUser < ActiveRecord::Migration
  def change
    add_column :users, :maj, :boolean
  end
end
