json.array!(@users) do |user|
  json.extract! user, :id, :name, :office, :ext, :phone, :departament_id
  json.url user_url(user, format: :json)
end
