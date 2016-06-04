class Like < ActiveRecord::Base
  belongs_to :user
  after_save :recipe_likes

  def recipe_likes
    @recipe = Recipe.find(self.recipe_id)
    @recipe.update(likes: @recipe.likes + 1)
  end
end
