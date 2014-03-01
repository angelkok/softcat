require 'spec_helper'

describe Team do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "assignments" do
    it { should allow_mass_assignment_of(:name) }
  end

  describe "associations" do
    it { should have_many(:players) }
    it { should have_many(:positions).through(:players) }

    describe ".positions" do
      let(:team) { create(:team) }
      let(:assigned_position_1) { create(:position) }
      let(:assigned_position_2) { create(:position) }

      before do
        create(:player, :team => team, :position => assigned_position_1)
        create(:player, :team => team, :position => assigned_position_1)
        create(:player, :team => team, :position => assigned_position_2)
        create(:position, name: 'Unassigned Position')
      end

      it "lists unique positions" do
        expect(team.positions.order(:id)).to eq [assigned_position_1, assigned_position_2]
      end

    end
  end
end
