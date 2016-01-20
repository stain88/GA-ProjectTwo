class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam
  mount_uploaders :screenshots, ScreenshotUploader
  mount_uploader :game_file, GameFileUploader
  mount_uploaders :multifiles, GameFileUploader

  validates_presence_of :title
  validates_uniqueness_of :title, :case_sensitive => false
  validates_presence_of :jam_id

  acts_as_commontable
  acts_as_votable
end
