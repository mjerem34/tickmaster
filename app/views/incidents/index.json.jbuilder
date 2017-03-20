json.array!(@incidents) do |incident|
  json.extract! incident, :id, :content, :title, :user_id, :tech_id, :category_id, :sous_category_id,
                :lvl_urgence_user, :lvl_urgence_tech, :cloture_user, :cloture_tech, :pc_id, :ip_adress, :solution, :keywords,
                :link_faq, :incident_state_id_for_user_id, :incident_state_id_for_tech_id, :lvl_of_incident, :archived_at,
                :resolved_at, :created_at, :updated_at, :notify_for_tech, :notify_for_user
  json.url incident_url(incident, format: :json)
end
