class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name, limit: 45
      t.string :adress, limit: 100
      t.string :adress2, limit: 100
      t.string :adress3, limit: 100
      t.string :cp, limit: 20
      t.string :city, limit: 45
      t.string :email, limit: 45
      t.string :tel, limit: 20
      t.string :fax, limit: 20
      t.string :department, limit: 20
      t.string :ip_adress, limit: 50
      


    end
  end
end
