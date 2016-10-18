class CreateFieldAgencyAgencies < ActiveRecord::Migration
  def change
    create_table :field_agency_agencies do |t|
      t.integer :agency_id
      t.integer :field_agency_id
      t.text :content
    end
  end
end
