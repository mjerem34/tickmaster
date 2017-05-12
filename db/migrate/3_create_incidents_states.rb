class CreateIncidentsStates < ActiveRecord::Migration
  def change
    create_table :incidents_states do |t|
      t.string :name, null: false, unique: true
      t.string :shortcut, null: false, unique: true
      t.string :user_color, null: false, unique: true
      t.string :tech_color, null: false, unique: true
    end
  end
end
