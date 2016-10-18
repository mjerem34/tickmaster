class AddSysMsgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sys_msg, :boolean
  end
end
