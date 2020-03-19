class Achievement < ApplicationRecord
  has_many :ratings
  has_many :players, through: :ratings, dependent: :destroy
end
