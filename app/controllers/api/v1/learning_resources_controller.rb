class Api::V1::LearningResourcesController < ApplicationController
  def index
    if params[:country] == ''
      country = RandomCountryService.random_search
    else
      country = params[:country].downcase
      resources = LearningResourcesFacade.get_resources(country)
      render json: LearningResourceSerializer.new(resources)
    end
  end
end
