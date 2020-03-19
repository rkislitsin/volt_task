5.times do
  command = Command.create(name: Faker::Sports::Football.team)
  11.times { Player.create(name: Faker::Sports::Football.player, command: command) }
end

5.times do |i|
  home_command = Command.all[i]
  Command.where.not(id: home_command.id).each do |guest_command|
    Match.create(name: Faker::Company.name, home_command: home_command, guest_command: guest_command)
  end
end

10.times { Achievement.create(name: Faker::Superhero.power) }

500.times { Rating.create(player: Player.all.sample, achievement: Achievement.all.sample, match: Match.all.sample) }