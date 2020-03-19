class Match < ApplicationRecord
  belongs_to :home_command, class_name: 'Command', foreign_key: 'home_command_id'
  belongs_to :guest_command, class_name: 'Command', foreign_key: 'guest_command_id'
end
