class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /api/v1/recipes
  # GET /api/v1/recipes.json
  def index
    @recipes = ::Recipe.all
  end

  # GET /api/v1/recipes/1
  # GET /api/v1/recipes/1.json
  def show
  end

  # POST /api/v1/recipes
  # POST /api/v1/recipes.json
  def create
    @recipe = ::Recipe.new(recipe_params)

    if @recipe.save
      render :show, status: :created, location: api_v1_recipe_url(@recipe)
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/recipes/1
  # PATCH/PUT /api/v1/recipes/1.json
  def update
    if @recipe.update(recipe_params)
      render :show, status: :ok, location: api_v1_recipe_url(@recipe)
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/recipes/1
  # DELETE /api/v1/recipes/1.json
  def destroy
    @recipe.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = ::Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :instructions, :duration, ingredients_attributes: [ :name, :quantity, :units ])
    end
end
