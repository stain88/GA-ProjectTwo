class AddKongLinkToGames < ActiveRecord::Migration
  def change
    add_column :games, :kong_link, :text
  end
end
