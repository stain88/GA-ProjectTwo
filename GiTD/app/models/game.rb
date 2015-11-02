class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam
  mount_uploaders :screenshots, ScreenshotUploader
end
