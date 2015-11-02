class AddScreenshotsToGames < ActiveRecord::Migration
  def change
    add_column :games, :screenshots, :json
  end
end
