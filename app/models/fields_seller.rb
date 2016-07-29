class FieldsSeller < ActiveRecord::Base
  has_many :FieldsSellerSellers
  has_many :Sellers, through: :FieldsSellerSellers
end
