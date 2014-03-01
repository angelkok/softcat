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

positions.each do |position|
  Position.find_or_create_by_name(position)
end
