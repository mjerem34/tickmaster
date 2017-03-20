class CreateFileIncidents < ActiveRecord::Migration
  def change
    create_table :file_incidents do |t|
      t.references :incident, index: true, foreign_key: true, null: false
      t.string :file
      t.integer :file_size
      t.string :content_type
    end
  end
end
