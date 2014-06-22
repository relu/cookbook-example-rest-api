require "rails_helper"

RSpec.describe Api::V1::RecipesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/recipes").to route_to("api/v1/recipes#index")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/recipes/1").to route_to("api/v1/recipes#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/recipes").to route_to("api/v1/recipes#create")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/recipes/1").to route_to("api/v1/recipes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/recipes/1").to route_to("api/v1/recipes#destroy", :id => "1")
    end

  end
end
