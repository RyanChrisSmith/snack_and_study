class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipeSerializer.new(RecipesFacade.get_all_recipes(params[:country]))
  end
end
