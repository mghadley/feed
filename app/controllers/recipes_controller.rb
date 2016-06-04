class RecipesController < ApplicationController
  before_action :user
  before_action :recipe, only: [:edit, :update, :destroy, :create]


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
  	@recipe = Recipe.new(recipe_params)
  	if @recipe.save
  		flash[:success] = "Recipe created successfully"
	  	redirect_to ingredeints_new_path(id: @recipe_id)
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
  	params.require(:recipe).permit(:name, :duration, :difficulty, :category, :food_type, :instructions, :likes)
  end

  def recipe
  	@recipe = current_user.lists.find(params[:id])
  end
end
