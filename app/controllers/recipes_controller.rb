class RecipesController < ApplicationController
  before_action :user
  before_Action :recipe, only: [:edit, :update, :destroy, :create]


  def index
  	@recipes = current_user.recipes
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def new
  	@recipe = current_user.recipe.new
  end

  def edit
  end

  def destroy
  	@recipe.destroy
  	redirect_to recipe_path #If errors, this might need to redirect to the root path
  end

  def create
  	redirect_to recipes_new_path(id: @recipe_id) #there doesnt need to be a path to ingredients here
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
  	params.require(:recipe).permit(:name, :duration, :difficulty, :category, :food_type, :instructions, :likes)
  end

  def recipe
  	@recipe = current_user.lists.find(params[:id])
  end
end
