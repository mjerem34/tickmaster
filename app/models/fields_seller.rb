class FieldsSeller < ActiveRecord::Base
  has_many :fields_seller_sellers
  has_many :sellers, through: :fields_seller_sellers

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
