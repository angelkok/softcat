require 'spec_helper'

describe Position do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe "assignments" do
    it { should allow_mass_assignment_of(:name) }
  end

  describe "associations" do
    it { should have_many(:players) }
  end
end
