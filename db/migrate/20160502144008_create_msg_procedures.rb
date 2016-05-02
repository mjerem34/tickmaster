class CreateMsgProcedures < ActiveRecord::Migration
  def change
    create_table :msg_procedures do |t|
      t.integer :id_procedures
      t.text :contenu

      t.timestamps null: false
    end
  end
end
