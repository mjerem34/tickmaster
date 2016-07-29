class TypesMaterialsSeller < ActiveRecord::Base
  belongs_to :TypeMaterial
  belongs_to :Seller
end
