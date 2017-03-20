class CreateFileArchives < ActiveRecord::Migration
  def change
    create_table :file_archives do |t|
      t.references :archive, index: true, foreign_key: true, null: false
      t.string :file
      t.integer :file_size
      t.string :content_type
    end
  end
end
