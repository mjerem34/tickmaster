class FieldSellerSeller < ActiveRecord::Base
  belongs_to :field_seller
  belongs_to :seller
end
