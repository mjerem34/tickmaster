class CreateFieldAgencyAgencies < ActiveRecord::Migration
  def change
    create_table :field_agency_agencies do |t|
      t.references :agency, index: true, foreign_key: true, null: false
      t.references :field_agency, index: true, foreign_key: true, null: false
      t.text :content, unique: true
    end
  end
end
