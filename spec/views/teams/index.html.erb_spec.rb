require "spec_helper"

describe "teams/index" do
  before do
    create_teams_positions_players
    @teams = Team.all
    assign(:teams, @teams)

    render :template => 'teams/index'

    @body = Capybara.string(rendered)
  end

  it "contains a list of teams" do
    @teams.each do |team|
      expect(@body.find("a:contains('#{team.name}')")[:href]).to eq(url_for(team))
    end
  end

  it "contains a number of unique positions for each team" do
    @teams.each do |team|
      content_team_positions = @body.find("span[id=\"team_#{team.id}_unique_positions\"]")
      expect(content_team_positions).to have_content("Positions: #{team.positions.count}")
    end
  end

  it "contains a link to crate a new team" do
    new_team_link = @body.find("a:contains('New Team')")
    expect(new_team_link[:href]).to eq(new_team_path)
  end

  it "contains a link to players index" do
    players_index_link = @body.find("a:contains('See All Players')")
    expect(players_index_link[:href]).to eq(players_path)
  end
end
