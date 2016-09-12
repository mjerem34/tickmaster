class FieldsSeller < ActiveRecord::Base
  has_many :fields_seller_sellers
  has_many :sellers, through: :fields_seller_sellers
end
