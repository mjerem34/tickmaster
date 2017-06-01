class Procedure < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  belongs_to :sous_category, class_name: 'SousCategory', foreign_key: 'sous_category_id'
  has_many :MsgProcedure
  validates :nom, presence: true, length: { in: 0..254 }
  validates :contenu, presence: true, length: { in: 0..65_535 }
  validates :resolution, presence: true, length: { in: 0..65_535 }
  validates :category_id, presence: true
  validates :sous_category_id, presence: true
end
