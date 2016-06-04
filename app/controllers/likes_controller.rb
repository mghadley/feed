class LikesController < ApplicationController
  before_action :recipe

  def create
    if current_user.likes.create(like_params)
      redirect_to recipe_path(@recipe)
    end
  end

  private

    def like_params
        params.require(:like).permit(:recipe_id)
    end

    def recipe
      @recipe = current_user.recipes.find(params[:like][:recipe_id])
    end
end


