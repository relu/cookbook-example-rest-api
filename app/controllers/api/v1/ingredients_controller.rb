class Api::V1::IngredientsController < ApplicationController
  before_action :set_recipe, only: [:index, :create]
  before_action :set_ingredient, only: [:update, :destroy]

  # GET /api/v1/recipes/1/ingredients
  # GET /api/v1/recipes/1/ingredients.json
  def index
    @ingredients = @recipe.ingredients.all
  end

  # POST /api/v1/recipes/1/ingredients
  # POST /api/v1/recupes/1/ingredients.json
  def create
    @ingredient = @recipe.ingredients.new(ingredient_params)

    if @ingredient.save
      render :show, status: :created, location: api_v1_recipe_url(@ingredient.recipe)
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/ingredients/1
  # PATCH/PUT /api/v1/ingredients/1.json
  def update
    if @ingredient.update(ingredient_params)
      render :show, status: :ok, location: api_v1_recipe_url(@ingredient.recipe)
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/ingredients/1
  # DELETE /api/v1/ingredients/1.json
  def destroy
    @ingredient.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = ::Recipe.find(params[:recipe_id])
    end

    def set_ingredient
      @ingredient = ::Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :units)
    end
end
