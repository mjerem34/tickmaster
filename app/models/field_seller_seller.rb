class FieldSellerSeller < ActiveRecord::Base
  belongs_to :field_seller
  belongs_to :seller

  validates_uniqueness_of :content, scope: %i[seller_id field_seller_id]
end
