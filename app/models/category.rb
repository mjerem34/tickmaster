class Category < ActiveRecord::Base
  after_create :create_new_sous_category_called_test
  has_many :incidents
  has_many :sous_categories, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }, length: { in: 0..254 }

  def create_new_sous_category_called_test
    SousCategory.create(name: 'Autre', category_id: id, lvl_urgence_max: 10)
  end
end
