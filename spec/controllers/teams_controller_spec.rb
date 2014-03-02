require 'spec_helper'

describe TeamsController do

  describe "GET index" do
    def make_request
      get :index
    end

    let(:teams) { [create(:team), create(:team), create(:team)] }

    it "returns a 200" do
      make_request
      expect(response.code).to eq "200"
    end

    it "finds all Team objects" do
      Team.should_receive(:all).and_return(teams)
      make_request
    end

    it "renders a team index view" do
      expect(make_request).to render_template('teams/index')
    end
  end

  describe "GET show" do
    def make_request(options={})
      get :show, options
    end

    let(:team) { create(:team) }

    it "returns a 200" do
      make_request(id: team.id)
      expect(response.code).to eq "200"
    end

    it "finds the Team object by :id" do
      Team.should_receive(:find).with(team.id.to_s).and_return(team)
      make_request(id: team.id)
    end

    it "renders a team show view" do
      expect(make_request(id: team.id)).to render_template('teams/show')
    end
  end

  describe "GET new" do
    def make_request
      get :new
    end

    it "returns a 200" do
      make_request
      expect(response.code).to eq "200"
    end

    it "instantiates a new Team object" do
      Team.should_receive(:new)
      make_request
    end

    it "renders a team new view" do
      expect(make_request).to render_template('teams/new')
    end
  end

  describe "GET edit" do
    def make_request(options={})
      get :edit, options
    end

    let(:team) { create(:team) }

    it "returns a 200" do
      make_request(id: team.id)
      expect(response.code).to eq "200"
    end

    it "finds the Team object by :id" do
      Team.should_receive(:find).with(team.id.to_s).and_return(team)
      make_request(id: team.id)
    end

    it "renders a team edit view" do
      expect(make_request(id: team.id)).to render_template('teams/edit')
    end
  end

  describe "POST create" do
    def make_request(options={})
      post :create, options
    end

    let(:post_attributes) { attributes_for(:team) }

    it "redirects to :index" do
      make_request(team: post_attributes)
      expect(response.code).to redirect_to(teams_path)
    end

    it "creates a team" do
      make_request(team: post_attributes)
      expect{make_request(team: post_attributes)}.to change(Team, :count).by(1)
      expect(Team.last.name).to eq(post_attributes[:name])
    end
  end

  describe "PUT update" do
    def make_request(options={})
      put :update, options
    end

    let!(:team) { create(:team) }
    let(:put_attributes) {{id: team.id, team: {name: 'New Name'}}}

    it "redirects to :show" do
      make_request(put_attributes)
      expect(response.code).to redirect_to(team_path(team))
    end

    it "updates a team" do
      make_request(put_attributes)
      expect(team.name).not_to eq(team.reload.name)
      expect(team.name).to eq(put_attributes[:team][:name])
    end
  end
end
