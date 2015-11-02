# require 'carrierwave/orm/activerecord'

class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam
  mount_uploader :screenshots, ScreenshotUploader
end
