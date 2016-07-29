class CreateFieldsSellers < ActiveRecord::Migration
  def change
    create_table :fields_sellers do |t|
      t.string :name
    end
  end
end
