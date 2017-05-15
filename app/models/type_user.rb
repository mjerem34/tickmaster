# type_user.rb
class TypeUser < ActiveRecord::Base
  before_validation :set_actif_to_true
  has_many :field_type_user_type_users, dependent: :destroy
  has_many :field_type_users, through: :field_type_user_type_users
  has_many :users

  has_many :type_user_rights, dependent: :destroy
  has_many :rights, through: :type_user_rights

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }, length: { in: 0..254 }
  validates :secure, :is_tech, :actif, inclusion: { in: [true, false] }

  delegate :toggle, to: :rights_manager

  def set_actif_to_true
    self.actif = true
  end

  def rights_manager
    @rights_manager ||= RightsManager.new(nil, self)
  end
end
