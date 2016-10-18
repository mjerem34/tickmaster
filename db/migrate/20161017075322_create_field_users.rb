class CreateFieldUsers < ActiveRecord::Migration
  def change
    create_table :field_users do |t|
      t.integer :field_type_user_id
      t.integer :user_id
      t.text :content
    end
  end
end
