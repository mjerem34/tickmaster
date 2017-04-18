class SousCategory < ActiveRecord::Base
  has_many :incidents
  belongs_to :category

  validates :name, presence: true, length: { in: 0..254 }
  validates :lvl_urgence_max, presence: true
  validates :category_id, presence: true
end
