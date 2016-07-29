class Seller < ActiveRecord::Base
  has_many :FieldsSellerSellers
  has_many :FieldsSellers, through: :FieldsSellerSellers
  has_many :TypesMaterialsSellers
  has_many :TypeMaterials, through: :TypesMaterialsSellers
end
