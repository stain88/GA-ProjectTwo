json.array!(@jams) do |jam|
  json.extract! jam, :id, :title, :theme, :mechanic
  json.url jam_url(jam, format: :json)
end
