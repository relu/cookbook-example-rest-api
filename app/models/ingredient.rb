class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :units, presence: true
  validates :recipe_id, presence: { on: :update }
end
