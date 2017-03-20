module IncidentsHelper
  # Determine if user or tech can reply to the incident.
  def reply_possible(incident)
    case incident.incident_state_id_for_user_id
      when 10, 8, 7
        true
      else
        false
    end
  end

  # This is used to determine if an incident(passed in params) is clotured or rejected.
  # Is shorter than if...else
  def clotured_or_rejected?(incident)
      case incident.incident_state_id_for_user_id
      when 10, 7
        true
      else
        false
      end
  end

  def is_pending(incident)
    incident.incident_state_id_for_user_id == 8 ? true : false
  end
end
