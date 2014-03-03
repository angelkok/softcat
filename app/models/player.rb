class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :position

  attr_accessible :name, :team, :position

  validates_presence_of :name

  def team_name
    try(:team).try(:name)
  end

  def team_id
    try(:team).try(:id)
  end

  def position_name
    try(:position).try(:name)
  end

  def position_id
    try(:position).try(:id)
  end
end
