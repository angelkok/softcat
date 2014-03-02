class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
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

end
