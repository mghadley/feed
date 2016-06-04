class IngredientsController < ApplicationController
  def new
  end

  def create
    @recipe = current_user.recipes.find(params[:recipe_id])
    20.times do |i|
      unless params["name#{i}"].empty?
        @ingredient = Ingredient.find_or_initialize_by(name: params["name#{i}"])
        if @ingredient.save
          if Measurement.create(recipe_id: @recipe.id, ingredient_id: @ingredient.id, amount: params["amount#{i}"], unit: params["unit#{i}"]) 
            flash[:success] = "Ingredients Added Succssfully"
          else
            flash[:danger] = "Something went wrong"
            binding.pry
            redirect_to(root_path) and return @recipe
          end
        else
          flash[:danger] = "Something went wrong"
          redirect_to(root_path) and return @recipe
        end
      end
    end
    redirect_to recipe_path(@recipe)
  end

  # def edit
  #   @ingredient = Ingredient.find(params[:id])
  # end

  # def update
  #   @ingredient = Ingredient.find(params[:id])
  #   if @ingredient.update(ingredient_params)
  #     flash[:success] = "Ingredient updated"
  #     redirect_to @
  # end

  def destroy
    @measurement = Measurement.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @measurement.destroy
    redirect_to edit_recipe_path(@recipe)
  end
end
