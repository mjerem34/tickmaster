class Procedure < ActiveRecord::Base
  belongs_to :category
  belongs_to :sous_category
  has_many :MsgProcedure
  has_many :file_procedures
  accepts_nested_attributes_for :file_procedures
  validates :nom, presence: true, length: { in: 0..254 }
  validates :contenu, presence: true, length: { in: 0..65535 }
  validates :resolution, presence: true, length: { in: 0..65535 }
  validates :category_id, presence: true
  validates :sous_category_id, presence: true
end
