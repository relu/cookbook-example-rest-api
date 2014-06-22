json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :quantity, :units
  json.url api_v1_recipe_ingredients_url(ingredient.recipe, format: :json)
end
