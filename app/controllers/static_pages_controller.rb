class StaticPagesController < ApplicationController
  def splash
  	@trending = Recipe.trending
  end
end
