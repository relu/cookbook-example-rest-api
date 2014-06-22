require 'rails_helper'

describe Ingredient do

  it { should belong_to(:recipe) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:quantity) }

  it { should validate_numericality_of(:quantity).is_greater_than(0) }

  it { should validate_presence_of(:units) }

  it { should validate_presence_of(:recipe_id).on(:update) }

end
