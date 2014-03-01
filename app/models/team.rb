class Team < ActiveRecord::Base
  has_many :players
  has_many :positions, :through => :players, :uniq => true

  attr_accessible :name

  validates_presence_of :name
end
