class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :changesMade, null: false
      t.datetime :created_at, null: false
    end
  end
end
