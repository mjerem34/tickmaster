class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :title, limit: 200
      t.text :content
      t.integer :user_id, limit: 2
      t.integer :tech_id, limit: 2
      t.integer :category_id, limit: 2
      t.integer :sous_category_id, limit: 2
      t.integer :agency_id, limit: 2
      t.integer :lvl_urgence_user, limit: 1
      t.integer :lvl_urgence_tech, limit: 1
      t.boolean :cloture_user
      t.boolean :cloture_tech
      t.references :pc, index: true #pc_id
      t.string :ip_adress, limit: 255
      t.text :solution
      t.string :keywords, limit: 255
      t.string :link_faq, limit: 255
      t.integer :incident_state_id_for_user, limit: 1
      t.integer :incident_state_id_for_tech, limit: 1
      t.datetime :archived_at
      t.datetime :resolved_at
      t.timestamps null: false
    end
  end
end
