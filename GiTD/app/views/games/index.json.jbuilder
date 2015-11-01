json.array!(@games) do |game|
  json.extract! game, :id, :title, :description, :height, :width, :url, :user_id, :jam_id
  json.url game_url(game, format: :json)
end
