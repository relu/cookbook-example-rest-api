json.extract! @recipe, :id, :name, :description, :instructions, :duration, :created_at, :updated_at
json.ingredients @recipe.ingredients, :name, :quantity, :units
