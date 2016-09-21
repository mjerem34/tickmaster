class MaterialsSeller < ActiveRecord::Base
  has_many :materials_sellers
  has_many :materials, through: :materials_sellers
  belongs_to :seller
end
