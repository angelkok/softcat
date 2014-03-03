require "spec_helper"

describe "teams/edit" do
  before :each do
    @team = stub_model(Team)
    assign(:team, @team)
    render :template => 'teams/edit'
  end

  let(:form_content) { "team form" }

  it "renders the form partial" do
    stub_template "teams/_form.html.erb" => form_content
    render
    expect(rendered).to have_content(form_content)
  end

end
