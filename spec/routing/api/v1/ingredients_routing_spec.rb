require "rails_helper"

RSpec.describe Api::V1::IngredientsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/recipes/1/ingredients").to route_to("api/v1/ingredients#index", :recipe_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/recipes/1/ingredients").to route_to("api/v1/ingredients#create", :recipe_id => "1")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/ingredients/1").to route_to("api/v1/ingredients#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/ingredients/1").to route_to("api/v1/ingredients#destroy", :id => "1")
    end

  end
end
