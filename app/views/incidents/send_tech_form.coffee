$("#incident_tech_id[data_name='<%= @incident.id%>']").replaceWith("<%= User.where(id: @incident.tech_id).pluck(:surname, :name).join(' ') %>")
