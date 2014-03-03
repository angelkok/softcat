class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    @form_action = 'create'
  end

  def edit
    @team = Team.find(params[:id])
    @form_action = 'update'
  end

  def create
    Team.create(name: params[:team][:name])
    redirect_to action: 'index'
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(params[:team])
    redirect_to team_path(@team)
  end

  def destroy
    @team = Team.find(params[:id])
    @team.remove_players_from_team
    @team.delete
    redirect_to action: 'index'
  end

end
