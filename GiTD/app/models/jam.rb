class Jam < ActiveRecord::Base
  has_many :games, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :status
end
