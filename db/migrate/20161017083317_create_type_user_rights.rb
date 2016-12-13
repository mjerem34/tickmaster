class CreateTypeUserRights < ActiveRecord::Migration
  def change
    create_table :type_user_rights, id: false do |t|
      t.integer :right_id
      t.integer :type_user_id
      t.boolean :value
    end
    add_index :type_user_rights, [:right_id, :type_user_id], unique: true
  end
end
