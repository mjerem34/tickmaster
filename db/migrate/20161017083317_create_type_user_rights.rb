class CreateTypeUserRights < ActiveRecord::Migration
  def change
    create_table :type_user_rights do |t|
      t.integer :right_id
      t.integer :type_user_id
      t.boolean :value
    end
  end
end
