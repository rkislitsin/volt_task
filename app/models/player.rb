class Player < ApplicationRecord
  belongs_to :command
  has_many :ratings
  has_many :achievements, through: :ratings, dependent: :destroy
end
