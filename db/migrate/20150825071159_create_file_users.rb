class CreateFileUsers < ActiveRecord::Migration
  def change
    create_table :file_users do |t|
      t.integer :user_id
      t.string :file
      t.integer :file_size
      t.string :content_type

      t.timestamps null: false
    end
  end
end
