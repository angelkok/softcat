require "spec_helper"

describe "players/show" do
  before do
    create_teams_positions_players
    @player = Player.first
    assign(:player, @player)

    render :template => 'players/show'
    @body = Capybara.string(rendered)
  end

  it "contains player name" do
    expect(@body).to have_content(@player.name)
  end

  it "contains position name" do
    expect(@body).to have_content(@player.position.name)
  end

  it "contains a link to delete player" do
    delete_player_link = @body.find("a:contains('Delete Player')")
    expect(delete_player_link[:href]).to eq(player_path(@player))
  end

  it "contains a link to edit player" do
    edit_player_link = @body.find("a:contains('Edit Player')")
    expect(edit_player_link[:href]).to eq(edit_player_path(@player))
  end
end
