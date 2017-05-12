class CreateFieldAgencyAgencies < ActiveRecord::Migration
  def change
    create_table :field_agency_agencies do |t|
      t.references :agency, index: true, foreign_key: true
      t.references :field_agency, index: true, foreign_key: true
      t.text :content, unique: true, null: true
    end
  end
end
