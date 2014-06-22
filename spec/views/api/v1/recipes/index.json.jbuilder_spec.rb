require 'rails_helper'

RSpec.describe "api/v1/recipes/index", :type => :view do
  before(:each) do
    assign(:recipes, [
      Fabricate(:recipe),
      Fabricate(:recipe)
    ])
  end

  it "renders a list of recipes" do
    render

    json = JSON.parse(rendered)

    expect(json).to be_a(Array)

    first = json.first

    expect(first).to be_a(Hash)

    expect(first).to have_key("name")
    expect(first).to have_key("description")
    expect(first).to have_key("url")
  end
end
