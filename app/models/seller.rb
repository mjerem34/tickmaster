class Seller < ActiveRecord::Base
  before_validation :set_actif_to_true
  has_many :field_seller_sellers
  has_many :field_sellers, through: :field_seller_sellers
  has_many :type_material_sellers
  has_many :type_materials, through: :type_material_sellers
  has_many :materials

  validates :name, presence: true,
  uniqueness: { case_sensitive: false }, length: { in: 0..254 }
  validates :actif, presence: true, inclusion: { in: [true, false] }

  def set_actif_to_true
    self.actif ||= true
  end
end
