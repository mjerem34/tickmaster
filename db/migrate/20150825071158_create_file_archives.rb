class CreateFileArchives < ActiveRecord::Migration
  def change
    create_table :file_archives do |t|
      t.integer :archive_id
      t.string :file
      t.integer :file_size
      t.string :content_type

      t.timestamps null: false
    end
  end
end
