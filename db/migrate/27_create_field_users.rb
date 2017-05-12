class CreateFieldUsers < ActiveRecord::Migration
  def change
    create_table :field_users do |t|
      t.references :field_type_user, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :content
    end
    add_index :field_users, %i[field_type_user_id user_id], unique: true
  end
end
