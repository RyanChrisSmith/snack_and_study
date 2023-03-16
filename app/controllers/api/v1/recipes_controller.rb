class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == ''
      recipes = RecipesFacade.random
    else
      country = params[:country].downcase
      recipes = RecipesFacade.get_all_recipes(country)
    end
    render json: RecipeSerializer.new(recipes)
  end
end
