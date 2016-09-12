class FieldsSellerSeller < ActiveRecord::Base
  belongs_to :fields_seller, foreign_key: :fields_seller_id
  belongs_to :seller, foreign_key: :seller_id
end
