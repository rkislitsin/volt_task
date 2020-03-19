class Command < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :home_matches, class_name: 'Match', foreign_key: :home_command_id, dependent: :destroy
  has_many :guest_matches, class_name: 'Match', foreign_key: :guest_command_id, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
