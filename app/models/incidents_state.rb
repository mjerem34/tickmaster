# f.name { Faker::Lorem.words(3) }
# f.shortcut { Faker::Lorem.word }
# f.user_color "success"
# f.tech_color "success"
class IncidentsState < ActiveRecord::Base
  has_many :incident_state_id_for_tech, class_name: 'Incident', foreign_key: 'incident_state_id_for_tech_id'
  has_many :incident_state_id_for_user, class_name: 'Incident', foreign_key: 'incident_state_id_for_user_id'

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :shortcut, presence: true, uniqueness: { case_sensitive: false }
  validates :user_color, presence: true
  validates :tech_color, presence: true
end
