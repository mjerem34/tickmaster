# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :incidents
  has_many :sous_categories

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false}, length: { in: 0..29}

end
