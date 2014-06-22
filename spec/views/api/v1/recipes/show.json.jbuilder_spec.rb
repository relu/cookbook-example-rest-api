require 'rails_helper'

RSpec.describe "api/v1/recipes/show", :type => :view do
  before(:each) do
    @recipe = assign(:recipe, Fabricate(:recipe))
  end

  it "renders attributes in <p>" do
    render

    json = JSON.parse(rendered)

    expect(json).to be_a(Hash)

    expect(json["name"]).to eq(@recipe.name)
    expect(json["description"]).to eq(@recipe.description)
    expect(json["instructions"]).to eq(@recipe.instructions)
    expect(json["duration"]).to eq(@recipe.duration)
    expect(json["ingredients"]).to be_a(Array)
  end
end
