class Category < ActiveRecord::Base
  has_many :incidents
  has_many :sous_categories

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false}, length: { in: 0..29}

end
