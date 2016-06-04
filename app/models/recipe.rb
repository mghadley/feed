class Recipe < ActiveRecord::Base
	has_many :measurements
	has_many :ingredients, through: :measurements
	belongs_to :user

	def self.difficulty_options
		['Easy', 'Medium', 'Hard', 'Top Chef']
	end

	def self.category_options
		['Indian', 'Thai', 'Vegan', 'Mexican', 'Chinese', 'Italian', 'American']
	end

	def self.food_type_options
		['Breakfast', 'Lunch', 'Entree', 'Side Dish', 'Beverage', 'Dessert', 'Snack', 'Soup', 'Salad']
	end

end
