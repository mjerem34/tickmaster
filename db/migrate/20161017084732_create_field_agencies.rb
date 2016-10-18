class CreateFieldAgencies < ActiveRecord::Migration
  def change
    create_table :field_agencies do |t|
      t.string :name
    end
  end
end
