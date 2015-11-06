class AddMultipleFilesToGames < ActiveRecord::Migration
  def change
    add_column :games, :multifiles, :text, array: true, default: []
  end
end
