class Seller < ActiveRecord::Base
  has_many :field_seller_sellers
  has_many :field_sellers, through: :field_seller_sellers
  has_many :type_material_sellers
  has_many :type_materials, through: :type_material_sellers
  has_many :materials

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }, length: { in: 0..254 }
end
