class Achievement < ApplicationRecord
  has_many :ratings
  has_many :players, through: :ratings, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
