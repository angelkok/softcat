require "spec_helper"

describe "players/index" do
  before do
    create_teams_positions_players
    @players = Player.all
    assign(:players, @players)

    render :template => 'players/index'

    @body = Capybara.string(rendered)
  end

  it "contains a list of players" do
    @players.each do |player|
      expect(@body.find("a:contains('#{player.name}')")[:href]).to eq(url_for(player))
    end
  end

  it "contains a link to crate a new player" do
    new_player_link = @body.find("a:contains('New Player')")
    expect(new_player_link[:href]).to eq(new_player_path)
  end
end
