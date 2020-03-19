class Player < ApplicationRecord
  belongs_to :command
  has_many :ratings
  has_many :achievements, through: :ratings, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :command

  def self.top(achievement, command = nil, count = 5)
    if command.present?
      joins(:ratings, :command)
          .where(ratings: { achievement: achievement }, commands: { id: command })
          .group('ratings.player_id')
          .order('count(*) DESC').limit(count)
    else
      joins(:ratings)
          .where(ratings: { achievement: achievement })
          .group('ratings.player_id')
          .order('count(*) DESC').limit(count)
    end
  end

  def add_achievement(achievement, match)
    ratings.create(achievement: achievement, match: match)
  end


  def last_matches_achievements?(achievement)
    ratings.where(achievement_id: achievement,
                  match: Match.last_5_matches(command)).count.positive?
  end


end
