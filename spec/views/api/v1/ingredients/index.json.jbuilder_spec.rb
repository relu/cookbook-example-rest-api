require 'rails_helper'

RSpec.describe "api/v1/ingredients/index", :type => :view do

  let(:recipe) { Fabricate(:recipe) }

  before(:each) do
    assign(:ingredients, recipe.ingredients.all)
  end

  it "renders a list of ingredients" do
    render

    json = JSON.parse(rendered)

    expect(json).to be_a(Array)

    first = json.first

    expect(first).to be_a(Hash)

    expect(first["name"]).to eq(recipe.ingredients.first.name)
    expect(first["quantity"]).to eq(recipe.ingredients.first.quantity)
    expect(first["units"]).to eq(recipe.ingredients.first.units)
    expect(first["url"]).to eq(api_v1_recipe_ingredients_url(recipe.ingredients.first.recipe, format: :json))
  end
end
