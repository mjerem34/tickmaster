class TypeMaterial < ActiveRecord::Base
  has_many :TypesMaterialsSpecMaterials
  has_many :SpecsTypesMaterials, through: :TypesMaterialsSpecMaterials
  has_many :TypesMaterialsSellers
  has_many :Sellers, through: :TypesMaterialsSellers
end
