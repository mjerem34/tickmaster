class CreateFileUsers < ActiveRecord::Migration
  def change
    create_table :file_users do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :file
      t.integer :file_size
      t.string :content_type
    end
  end
end
