class Ingredient < ActiveRecord::Base
	has_many :measurements
	has_many :recipes, through: :measurements
	accepts_nested_attributes_for :measurements
end
