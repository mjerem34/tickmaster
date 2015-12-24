class CreateFileResponses < ActiveRecord::Migration
  def change
    create_table :file_responses do |t|
      t.integer :response_id
      t.string :file
      t.integer :file_size
      t.string :content_type
      
      t.timestamps null: false
    end
  end
end
