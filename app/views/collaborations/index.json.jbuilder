json.array!(@collaborations) do |collaboration|
  json.extract! collaboration, :id, :name, :desc, :country, :state, :county
  json.url collaboration_url(collaboration, format: :json)
end
