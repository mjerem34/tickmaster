class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content
      t.references :incident, index: true #incident_id
      t.integer :sender_id, limit: 2
      t.integer :receiver_id, limit: 2
      t.string :ip_adress_sender
      t.references :pc, index: true #pc_id

      t.timestamps null: false
    end
  end
end
