class Rating < ApplicationRecord
  belongs_to :player
  belongs_to :achievement
  belongs_to :match
end
