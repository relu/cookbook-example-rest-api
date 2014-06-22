require 'rails_helper'

describe Recipe do

  it { should have_many(:ingredients).dependent(:destroy) }

  it { should accept_nested_attributes_for(:ingredients) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:description) }

  it { should validate_presence_of(:instructions) }

  it { should validate_presence_of(:duration) }

  it { should validate_numericality_of(:duration).only_integer.is_greater_than(0) }

end
