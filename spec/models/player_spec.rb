require 'spec_helper'

describe Player do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "assignments" do
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:team) }
    it { should allow_mass_assignment_of(:position) }
  end

  describe "associations" do
    it { should belong_to :team }
    it { should belong_to :position }
  end

end
