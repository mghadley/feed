class Recipe < ActiveRecord::Base
	has_many :measurements
	has_many :ingredients, through: :measurements
	belongs_to :user
end
