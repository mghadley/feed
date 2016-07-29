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

  def add_one
    @recipe = Recipe.find(params[:ingredient][:recipe_id])
    @ingredient = Ingredient.find_or_create_by(recipe_params)
    @measurement = Measurement.create(recipe_id: @recipe.id, ingredient_id: @ingredient.id, 
                                      unit: params[:ingredient][:measurements][:unit], amount: params[:ingredient][:measurements][:amount])
    if @ingredient.save
      flash[:succes] = "Ingredient added successfully"
      redirect_to edit_recipe_path(@recipe)
    else
      flash[:danger] = @ingredient.errors.full_messages.join('<br>').html_safe
      redirect_to edit_recipe_path(@recipe)
    end
  end

  def destroy
    @measurement = Measurement.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @measurement.destroy
    redirect_to edit_recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:ingredient).permit(:name, measurements_attributes: [:unit, :amount])
  end
end
