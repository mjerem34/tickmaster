class CreateFieldAgencyAgencies < ActiveRecord::Migration
  def change
    create_table :field_agency_agencies, id: false do |t|
      t.integer :agency_id
      t.integer :field_agency_id
      t.text :content
    end
    add_index :field_agency_agencies, [:agency_id, :field_agency_id], unique: true
  end
end
