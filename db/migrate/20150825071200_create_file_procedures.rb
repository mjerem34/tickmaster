class CreateFileProcedures < ActiveRecord::Migration
  def change
    create_table :file_procedures do |t|
      t.integer :procedure_id
      t.string :file
      t.integer :file_size
      t.string :content_type

      t.timestamps null: false
    end
  end
end
