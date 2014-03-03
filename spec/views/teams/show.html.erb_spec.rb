require "spec_helper"

describe "teams/show" do
  before do
    create_teams_positions_players
    @team = Team.first
    assign(:team, @team)

    render :template => 'teams/show'
    @body = Capybara.string(rendered)
  end

  it "contains team name" do
    expect(@body).to have_content(@team.name)
  end

  it "contains a list of players" do
    @team.players.each do |player|
      player_content = @body.find("a:contains('#{player.name}')")
      expect(player_content[:href]).to eq(url_for(player))
      expect(@body.find("li#player_#{player.id}_item")).to have_content(player.position.name)
    end
  end

  it "contains a link to delete team" do
    delete_team_link = @body.find("a:contains('Delete Team')")
    expect(delete_team_link[:href]).to eq(team_path(@team))
  end

  it "contains a link to edit team" do
    edit_team_link = @body.find("a:contains('Edit Team')")
    expect(edit_team_link[:href]).to eq(edit_team_path(@team))
  end
end
