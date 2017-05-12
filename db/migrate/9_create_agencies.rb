class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name, null: false, unique: true
      t.string :ip_address, null: false
    end
  end
end
