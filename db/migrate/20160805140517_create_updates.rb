class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :changesMade

      t.timestamps null: false
    end
  end
end
