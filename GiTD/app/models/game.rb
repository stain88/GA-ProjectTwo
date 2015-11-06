class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam
  mount_uploaders :screenshots, ScreenshotUploader
  mount_uploaders :game_files, GameFileUploader

  validates_presence_of :title
  validates_presence_of :jam_id

  acts_as_commontable
  acts_as_votable
end
