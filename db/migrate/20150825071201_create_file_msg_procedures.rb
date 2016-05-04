class CreateFileMsgProcedures < ActiveRecord::Migration
  def change
    create_table :file_msg_procedures do |t|
      t.integer :msg_procedure_id
      t.string :file
      t.integer :file_size
      t.string :content_type

      t.timestamps null: false
    end
  end
end
