class CreateFieldsSellerSellers < ActiveRecord::Migration
  def change
    create_table :fields_seller_sellers do |t|
      t.integer :field_seller_id
      t.integer :seller_id
      t.string :content
    end
  end
end
