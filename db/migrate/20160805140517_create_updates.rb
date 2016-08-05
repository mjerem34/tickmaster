class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :changes

      t.timestamps null: false
    end
  end
end
