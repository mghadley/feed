class IngredientsController < ApplicationController
  def new
  end

  def create
    @recipe = current_user.recipes.find(params[:recipe_id])
    20.times do |i|
      @ingredient = Ingredient.find_or_initialize_by( params["name#{i}"])
      if @ingredient.save
        unless @measurement.create(recipe_id: @recipe.id, ingredient_id: @ingredient.id, amount: params["amount#{i}"], unit: params["unit#{i}"])
          flash[:danger] = "Something went wrong"
          render :new and return
        end
      else
        flash[:danger] = "Something went wrong"
        render :new and return
      end
    end
    flash[:success] = "Ingredients added successfully"
    redirect_to recipe_path(@recipe)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
