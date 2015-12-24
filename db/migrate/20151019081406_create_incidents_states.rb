class CreateIncidentsStates < ActiveRecord::Migration
  def change
    create_table :incidents_states do |t|
      t.string :name
      t.string :shortcut
    end
  end
end
