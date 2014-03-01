class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :position

  attr_accessible :name, :team, :position

  validates_presence_of :name
end
