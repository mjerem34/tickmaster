class FieldSeller < ActiveRecord::Base
  has_many :field_seller_sellers
  has_many :sellers, through: :field_seller_sellers

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
