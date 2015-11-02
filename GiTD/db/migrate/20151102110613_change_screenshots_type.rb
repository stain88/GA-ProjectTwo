class ChangeScreenshotsType < ActiveRecord::Migration
  def change
    change_column :games, :screenshots, :text
  end
end
