class Jam < ActiveRecord::Base
  has_many :games

  validates_presence_of :title
  validates_presence_of :status
end
