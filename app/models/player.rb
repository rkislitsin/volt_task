class Player < ApplicationRecord
  belongs_to :command
  has_many :ratings
  has_many :achievements, through: :ratings, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :command

  def add_achievement(achievement, match)
    ratings.create(achievement: achievement, match: match)
  end


  def last_matches_achievements?(achievement)
    ratings.where(achievement_id: achievement,
                  match: Match.last_5_matches(command)).count.positive?
  end
end
