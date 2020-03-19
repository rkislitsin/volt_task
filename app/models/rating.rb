class Rating < ApplicationRecord
  belongs_to :player
  belongs_to :achievement
  belongs_to :match

  validates :player_id, uniqueness: { scope: %i[achievement_id match_id] }
  validates_presence_of :player
  validates_presence_of :match
  validates_presence_of :achievement
end
