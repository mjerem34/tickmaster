class DetentorType < ActiveRecord::Base
  has_many :materials

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
