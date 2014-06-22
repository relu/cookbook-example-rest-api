require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Api::V1::IngredientsController, :type => :controller do

  let(:valid_attributes) { Fabricate.build(:ingredient).attributes }

  let(:invalid_attributes) { {id: false, name: nil, nothing: 'here'} }

  let(:recipe) { Fabricate(:recipe) }

  before :each do
    request.accept = "application/json"
  end

  describe "GET index" do
    it "assigns all ingredients as @ingredients" do
      ingredients = recipe.ingredients
      get :index, {recipe_id: recipe.to_param}
      expect(assigns(:ingredients)).to eq(ingredients)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ingredient" do
        expect {
          post :create, {:recipe_id => recipe.to_param, :ingredient => valid_attributes}
        }.to change(recipe.ingredients, :count).by(1)
      end

      it "assigns a newly created ingredient as @ingredient" do
        post :create, {:recipe_id => recipe.to_param, :ingredient => valid_attributes}
        expect(assigns(:ingredient)).to be_a(::Ingredient)
        expect(assigns(:ingredient)).to be_persisted
      end

      it "returns :created http status" do
        post :create, {:recipe_id => recipe.to_param, :ingredient => valid_attributes}
        expect(response).to have_http_status(:created)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ingredient as @ingredient" do
        post :create, {:recipe_id => recipe.to_param, :ingredient => invalid_attributes}
        expect(assigns(:ingredient)).to be_a_new(::Ingredient)
      end

      it "returns :unprocessable_entity https status" do
        post :create, {:recipe_id => recipe.to_param, :ingredient => invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        Fabricate.build(:ingredient, :recipe_id => recipe.id).attributes
      }

      it "updates the requested ingredient" do
        ingredient = Fabricate(:ingredient, :recipe_id => recipe.id)
        put :update, {:id => ingredient.to_param, :ingredient => new_attributes}
        ingredient.reload
        expect(response).to have_http_status(:ok)
      end

      it "assigns the requested ingredient as @ingredient" do
        ingredient = Fabricate(:ingredient, :recipe_id => recipe.id)
        put :update, {:id => ingredient.to_param, :ingredient => valid_attributes}
        expect(assigns(:ingredient)).to eq(ingredient)
      end

      it "returns :ok http status" do
        ingredient = Fabricate(:ingredient, :recipe_id => recipe.id)
        put :update, {:id => ingredient.to_param, :ingredient => valid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end

    describe "with invalid params" do
      it "assigns the ingredient as @ingredient" do
        ingredient = Fabricate(:ingredient, :recipe_id => recipe.id)
        put :update, {:id => ingredient.to_param, :ingredient => invalid_attributes}
        expect(assigns(:ingredient)).to eq(ingredient)
      end

      it "returns :unprocessable_entity http status" do
        ingredient = Fabricate(:ingredient, :recipe_id => recipe.id)
        put :update, {:id => ingredient.to_param, :ingredient => invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ingredient" do
      ingredient = Fabricate(:ingredient, :recipe_id => recipe.id)
      expect {
        delete :destroy, {:id => ingredient.to_param}
      }.to change(recipe.ingredients, :count).by(-1)
    end

    it "returns :no_content http status" do
      ingredient = Fabricate(:ingredient, :recipe_id => recipe.id)
      delete :destroy, {:id => ingredient.to_param}
      expect(response).to have_http_status(:no_content)
    end
  end

end
