json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :description
  json.url api_v1_recipe_url(recipe, format: :json)
end
