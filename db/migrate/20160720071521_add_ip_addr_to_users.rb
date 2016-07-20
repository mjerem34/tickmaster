class AddIpAddrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ip_addr, :string, limit: 20
  end
end
