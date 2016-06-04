class RecipesController < ApplicationController
  before_action :recipe, only: [:edit, :update, :destroy]


  def index
  	@recipes = current_user.recipes
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def new
  	@recipe = Recipe.new
  end

  def edit
  	@recipe = current_user.recipes.find(params[:id])
  end

  def destroy
  	@recipe.destroy
  	redirect_to root_path
  end

  def create
  	@recipe = current_user.recipes.new(recipe_params)
  	if @recipe.save
  		flash[:success] = "Recipe created successfully"
	  	redirect_to new_ingredients_path(id: @recipe.id)
	  else
	  	flash[:danger] = @recipe.errors.full_messages.join('<br>').html_safe
	  	render :new
	  end
  end

  def update
  	if @recipe.update 
  		redirect_to recipe_path(@recipe)
  	else
  		render :edit
  	end
  end

  private

  def recipe_params
  	params.require(:recipe).permit(:name, :hours, :minutes, :difficulty, :category, :food_type, :instructions, :likes)
  end

  def recipe
  	@recipe = current_user.recipes.find(params[:id])
  end

end
