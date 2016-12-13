class CreateTypeUserRights < ActiveRecord::Migration
  def change
    create_table :type_user_rights, id: false do |t|
      t.references :right, index: true, foreign_key: true
      t.references :type_user, index: true, foreign_key: true
      t.boolean :value, null: false
    end
    add_index :type_user_rights, [:right_id, :type_user_id], unique: true
  end
end
