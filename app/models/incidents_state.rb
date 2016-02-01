class IncidentsState < ActiveRecord::Base

  has_many :incident_state_id_for_tech, class_name: 'Incident', foreign_key: 'incident_state_id_for_tech_id'
  has_many :incident_state_id_for_user, class_name: 'Incident', foreign_key: 'incident_state_id_for_user_id'
end
