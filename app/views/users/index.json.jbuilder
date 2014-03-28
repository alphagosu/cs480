json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :country, :state, :county
  json.url user_url(user, format: :json)
end
