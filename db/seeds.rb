# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
positions = %w(Pitcher Catcher Shortstep)
positions = %w(Left\ Outfilder Right\ Outfilder Center\ Outfilder) + positions
positions = %w(First\ Baseman Second\ Baseman Third\ Baseman) + positions

positions.each do |position_name|
  Position.find_or_create_by_name(position_name)
end

%w(Timbers Seahawks Spring\ Chicks Easterly\ Locks).each do |team_name|
  team = Team.find_or_create_by_name(team_name)

  Position.all.each do |position|
    Player.create(name: Faker::Name.name, team: team, position: position)
  end
end

