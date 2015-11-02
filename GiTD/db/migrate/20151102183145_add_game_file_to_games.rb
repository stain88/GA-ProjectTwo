class AddGameFileToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_file, :text
  end
end
