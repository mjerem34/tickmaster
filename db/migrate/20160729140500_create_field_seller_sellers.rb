class CreateFieldSellerSellers < ActiveRecord::Migration
  def change
    create_table :field_seller_sellers, id: false do |t|
      t.references :field_seller, index: true, foreign_key: true
      t.references :seller, index: true, foreign_key: true
      t.text :content, unique: true, null: false
    end
    add_index :field_seller_sellers, [:field_seller_id, :seller_id], unique: true
  end
end
