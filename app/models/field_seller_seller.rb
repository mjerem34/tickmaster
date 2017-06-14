# field_seller_seller.rb
class FieldSellerSeller < ActiveRecord::Base
  belongs_to :field_seller
  belongs_to :seller

  validates_uniqueness_of :seller_id, scope: :field_seller_id
end
