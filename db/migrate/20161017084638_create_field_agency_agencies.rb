class CreateFieldAgencyAgencies < ActiveRecord::Migration
  def change
    create_table :field_agency_agencies do |t|
      t.references :agency, index: true, foreign_key: true
      t.references :field_agency, index: true, foreign_key: true
      t.text :content, unique: true, null: false
    end
    add_index :field_agency_agencies, [:agency_id, :field_agency_id], unique: true
  end
end
