class Seller < ActiveRecord::Base
  has_many :fields_seller_sellers
  has_many :fields_sellers, through: :fields_seller_sellers
  has_many :types_materials_sellers
  has_many :type_materials, through: :types_materials_sellers
end
