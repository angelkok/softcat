class Team < ActiveRecord::Base
  has_many :players
  has_many :positions, :through => :players, :uniq => true

  attr_accessible :name

  validates_presence_of :name

  def remove_players_from_team
    players.each do |player|
      player.update_attributes(team: nil)
    end
  end
end
