class Recipe < ActiveRecord::Base
	has_many :measurements
	has_many :ingredients, through: :measurements
	
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	validate :duration_greater_than_zero

	acts_as_commontable

	def duration_greater_than_zero
		if (self.hours + self.minutes) <= 0
			errors.add(:recipe, 'Duration must be greater than 0')
		end
	end

	def duration
		duration = ""
		if self.hours > 0 && self.minutes > 0
			duration += "#{self.hours} hours and #{self.minutes} minutes"
		elsif self.hours > 0
			duration += "#{self.hours}.hours"
		else self.minutes > 0
			duration += "#{self.minutes} minutes"
		end
		return duration
	end

	def self.difficulty_options
		['Easy', 'Medium', 'Hard', 'Top Chef']
	end

	def self.category_options
		['Indian', 'Thai', 'Vegan', 'Mexican', 'Chinese', 'Italian', 'American']
	end

	def self.food_type_options
		['Breakfast', 'Lunch', 'Entree', 'Side Dish', 'Beverage', 'Dessert', 'Snack', 'Soup', 'Salad']
	end

	def self.trending
		arr = Like.limit(5).pluck(:recipe_id)
		return arr.map {|id| Recipe.find(id)}
	end

	def self.search(search_params)
		where('name ilike ?', "%#{search_params}%")
	end

end
