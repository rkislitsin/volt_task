class Match < ApplicationRecord
  belongs_to :home_command, class_name: 'Command', foreign_key: 'home_command_id'
  belongs_to :guest_command, class_name: 'Command', foreign_key: 'guest_command_id'

  validates :home_command_id, uniqueness: { scope: :guest_command_id }
  validates_presence_of :name
  validates_presence_of :home_command
  validates_presence_of :guest_command
end
