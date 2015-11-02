class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam
  mount_uploader :screenshots, ScreenshotUploader
  mount_uploader :game_file, GameFileUploader
end
