class CreatePc < ActiveRecord::Migration
  def change
    create_table :pcs do |t|
      t.string :ip_adress, limit: 255
      t.string :serial_number, limit: 255
      t.string :mac_adress, limit: 255
      t.string :name_holder, limit: 255
      t.datetime :buy_date
      t.datetime :warranty_date

    end
  end
end
