class CreateFieldAgencies < ActiveRecord::Migration
  def change
    create_table :field_agencies do |t|
      t.string :name, unique: true, null: false
    end
  end
end
