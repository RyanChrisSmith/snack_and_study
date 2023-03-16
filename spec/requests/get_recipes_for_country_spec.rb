require 'rails_helper'

RSpec.describe 'Recipes API' do

  describe 'happy path' do
    it 'returns a list of recipes from a specified country' do
      get '/api/v1/recipes?country=thailand'

      recipes = JSON.parse(response.body, symbolize_names: true)
      require 'pry' ; binding.pry

    end
  end

end