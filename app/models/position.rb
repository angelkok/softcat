class Position < ActiveRecord::Base
  has_many :players

  attr_accessible :name

  validates :name, presence: true, uniqueness: true
end
