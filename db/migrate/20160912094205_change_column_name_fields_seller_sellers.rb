class ChangeColumnNameFieldsSellerSellers < ActiveRecord::Migration
  def change
    rename_column :fields_seller_sellers, :field_seller_id, :fields_seller_id
  end
end
