class CreateFileIncidents < ActiveRecord::Migration
  def change
    create_table :file_incidents do |t|
      t.integer :incident_id
      t.string :file
      t.integer :file_size
      t.string :content_type

      t.timestamps null: false
    end
  end
end
