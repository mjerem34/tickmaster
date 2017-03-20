class CreatePcs < ActiveRecord::Migration[5.0]
  def change
    create_table :pcs do |t|
      t.text :name
      t.text :ip
      t.text :mac
      t.integer :user, index: true, foreign_key: true
    end
  end
end
