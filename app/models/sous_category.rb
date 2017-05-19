# sous_category.rb
class SousCategory < ActiveRecord::Base
  has_many :incidents
  belongs_to :category

  validates :name, presence: true, length: { in: 0..254 }
  validates_uniqueness_of :category_id, scope: [:name], case_sensitive: :false
  validates :lvl_urgence_max, presence: true,
                              numericality: {
                                greater_than_or_equal_to: 0,
                                less_than_or_equal_to: 10
                              }
  validates :category_id, presence: true

  before_validation :set_lvl_urgence_max

  def set_lvl_urgence_max
    self.lvl_urgence_max = 10 if lvl_urgence_max.nil?
  end
end
