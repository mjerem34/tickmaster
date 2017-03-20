class CreateFieldSellers < ActiveRecord::Migration
  def change
    create_table :field_sellers do |t|
      t.string :name, unique: true, null: false
    end
  end
end
