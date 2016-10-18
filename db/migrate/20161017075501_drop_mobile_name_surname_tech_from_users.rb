class DropMobileNameSurnameTechFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :mobile, :string
    remove_column :users, :name, :string
    remove_column :users, :surname, :string
    remove_column :users, :tech_id, :integer
  end
end
