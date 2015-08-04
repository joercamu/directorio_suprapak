json.array!(@teams) do |team|
  json.extract! team, :id, :nombre, :stars, :city
  json.url team_url(team, format: :json)
end
