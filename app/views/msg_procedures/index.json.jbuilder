json.array!(@msg_procedures) do |msg_procedure|
  json.extract! msg_procedure, :id, :id_procedures, :contenu
  json.url msg_procedure_url(msg_procedure, format: :json)
end
