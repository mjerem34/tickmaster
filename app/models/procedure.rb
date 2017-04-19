class Procedure < ActiveRecord::Base
  attr_accessor :file, :file_procedures
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  belongs_to :sous_category, class_name: 'SousCategory', foreign_key: 'sous_category_id'
  has_many :MsgProcedure
  has_many :file_procedures
  accepts_nested_attributes_for :file_procedures
  validates :nom, presence: true, length: { in: 0..254 }
  validates :contenu, presence: true, length: { in: 0..65535 }
  validates :resolution, presence: true, length: { in: 0..65535 }
  validates :category_id, presence: true
  validates :sous_category_id, presence: true

end
