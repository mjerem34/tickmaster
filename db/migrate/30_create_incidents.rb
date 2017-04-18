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
      t.integer :lvl_urgence_tech, limit: 1, null: false
      t.integer :lvl_of_incident
      t.boolean :cloture_user, null: false
      t.boolean :cloture_tech, null: false
      t.string :ip_adress, null: false
      t.references :incident_state_id_for_user, index: true
      t.references :incident_state_id_for_tech, index: true
      t.datetime :archived_at
      t.datetime :resolved_at
      t.timestamps null: false
      t.boolean :notify_for_tech
      t.boolean :notify_for_user
      # t.references :pc, index: true, foreign_key: true, null: false
      # t.text :solution
      # t.string :keywords
      # t.string :link_faq
    end
  end
end
