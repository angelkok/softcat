class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
    @form_action = 'create'

    @team_options, @position_options = get_select_menu_options
  end

  def edit
    @player = Player.find(params[:id])
    @form_action = 'update'

    @team_options, @position_options = get_select_menu_options
  end

  def create
    Player.create(get_player_params)
    redirect_to action: 'index'
  end

  def update
    @player = Player.find(params[:id])

    @player.update_attributes(get_player_params)
    redirect_to player_path(@player)
  end

  def destroy
    @player = Player.find(params[:id])
    @player.delete
    redirect_to action: 'index'
  end

  private

  def get_player_params
    player_params = params[:player]
    player_params[:team] = Team.where(id: player_params["team"]).first
    player_params[:position] = Position.where(id: player_params["position"]).first
    player_params
  end

  def get_select_menu_options
    team_options =  [['Select Team','']] + Team.all.collect{|team| [team.name, team.id]}
    position_options = [['Select Position','']] + Position.all.collect{|position| [position.name, position.id]}
    return team_options, position_options
  end

end
