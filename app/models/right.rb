class Right < ActiveRecord::Base
  has_many :type_user_rights, dependent: :destroy
  has_many :type_users, through: :type_user_rights

  validates :name, presence: true, length: { in: 0..254 }
  validates :content, presence: true, length: { in: 0..254 }
end
