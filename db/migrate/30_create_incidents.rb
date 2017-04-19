class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :title, limit: 200, null: false
      t.text :content, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :tech, index: true, null: false
      t.references :category, index: true, foreign_key: true, null: false
      t.references :sous_category, index: true, foreign_key: true, null: false
      t.integer :lvl_urgence_user, limit: 1, null: false
      t.integer :lvl_urgence_tech, limit: 1, default: 1
      t.integer :lvl_of_incident, limit: 1, default: 1
      t.boolean :cloture_user, default: false
      t.boolean :cloture_tech, default: false
      t.string :ip_adress, null: false
      t.references :incident_state_id_for_user, index: true, default: 1
      t.references :incident_state_id_for_tech, index: true, default: 1
      t.datetime :archived_at
      t.datetime :resolved_at
      t.timestamps null: false
      t.boolean :notify_for_tech, default: 1
      t.boolean :notify_for_user, default: 0
    end
  end
end
