class CreateFieldSellerSellers < ActiveRecord::Migration
  def change
    create_table :field_seller_sellers do |t|
      t.references :field_seller, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.text :content, unique: true, null: false
    end
  end
end
