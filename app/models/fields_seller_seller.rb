class FieldsSellerSeller < ActiveRecord::Base
  belongs_to :FieldsSeller
  belongs_to :Seller
end
