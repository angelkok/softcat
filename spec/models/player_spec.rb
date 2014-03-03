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

  describe "#team_name" do
    let(:team) { create(:team) }
    let(:player_in_team) { build(:player, team: team )}
    let(:player_not_in_team) { build(:player)}

    it "returns team name when team is present" do
      expect(player_in_team.team_name).to eq(team.name)
    end

    it "returns nil when team is not present" do
      expect(player_not_in_team.team_name).to be_nil
    end
  end

  describe "#team_id" do
    let(:team) { create(:team) }
    let(:player_in_team) { build(:player, team: team )}
    let(:player_not_in_team) { build(:player)}

    it "returns team id when team is present" do
      expect(player_in_team.team_id).to eq(team.id)
    end

    it "returns nil when team is not present" do
      expect(player_not_in_team.team_id).to be_nil
    end
  end

  describe "#position_name" do
    let(:position) { create(:position) }
    let(:player_with_position) { build(:player, position: position )}
    let(:player_without_position) { build(:player)}

    it "returns position name when position is present" do
      expect(player_with_position.position_name).to eq(position.name)
    end

    it "returns nil when position is not present" do
      expect(player_without_position.position_name).to be_nil
    end
  end

  describe "#position_id" do
    let(:position) { create(:position) }
    let(:player_with_position) { build(:player, position: position )}
    let(:player_without_position) { build(:player)}

    it "returns position id when position is present" do
      expect(player_with_position.position_id).to eq(position.id)
    end

    it "returns nil when position is not present" do
      expect(player_without_position.position_id).to be_nil
    end
  end

end
