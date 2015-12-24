# == Schema Information
#
# Table name: sous_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SousCategory < ActiveRecord::Base
  has_many :incidents
  belongs_to :categorie

  validates :name, :presence => true,
                    :uniqueness => {:case_sensitive => false}, length: { in: 0..29}


end
