class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :ingredients

  validates :name, presence: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
