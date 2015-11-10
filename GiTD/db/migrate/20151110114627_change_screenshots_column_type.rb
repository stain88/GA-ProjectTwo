class ChangeScreenshotsColumnType < ActiveRecord::Migration
  def change
    remove_column :games, :screenshots
    add_column :games, :screenshots, :text, array: true, default: []
  end
end
