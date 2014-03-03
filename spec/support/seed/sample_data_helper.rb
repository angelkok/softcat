module SampleDataHelper
  def create_teams_positions_players
    team_a = create(:team, name: 'TEAM_A')
    team_b = create(:team, name: 'TEAM_B')
    team_c = create(:team, name: 'TEAM_C')
    team_d = create(:team, name: 'TEAM_D')

    position_a = create(:position, name: 'POSITION_A')
    position_b = create(:position, name: 'POSITION_B')
    position_c = create(:position, name: 'POSITION_C')
    position_d = create(:position, name: 'POSITION_D')

    player_a = create(:player, name: 'PLAYER_A', position: position_a, team: team_a)
    player_b = create(:player, name: 'PLAYER_B', position: position_b, team: team_a)
    player_c = create(:player, name: 'PLAYER_C', position: position_a, team: team_b)
    player_d = create(:player, name: 'PLAYER_D', position: position_d, team: team_b)
  end
end
