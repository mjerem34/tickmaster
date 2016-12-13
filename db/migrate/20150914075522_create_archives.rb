class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.text :content
      t.references :incident, index: true, foreign_key: true, null: false
      t.references :sender, index: true, foreign_key: true, null: false
      t.references :receiver, index: true, foreign_key: true, null: false
      t.string :ip_adress_sender, null: false
      t.timestamps null: false
    end
  end
end
