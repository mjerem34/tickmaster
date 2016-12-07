class CreateFieldsSellerSellers < ActiveRecord::Migration
  def change
    create_table :fields_seller_sellers, id: false do |t|
      t.integer :field_seller_id
      t.integer :seller_id
      t.text :content
    end
    add_index :fields_seller_sellers, [:field_seller_id, :seller_id], unique: true
  end
end
