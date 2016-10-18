class AddTypeUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type_user_id, :integer
  end
end
