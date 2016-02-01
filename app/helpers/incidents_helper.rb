module IncidentsHelper
  def reply_possible(incident)
    case incident.incident_state_id_for_user
      when 10, 8, 7
        true
      else
        false
    end
  end

  def clotured_or_rejected?(incident)
      case incident.incident_state_id_for_user.id
      when 10, 7
        true
      else
        false
      end
  end

  def is_pending(incident)
    incident.incident_state_id_for_user == 8 ? true : false
  end
end
