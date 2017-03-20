class CreateTypeUserRights < ActiveRecord::Migration
  def change
    create_table :type_user_rights do |t|
      t.references :right, foreign_key: true
      t.references :type_user, foreign_key: true
      t.boolean :value, null: false
    end
  end
end
