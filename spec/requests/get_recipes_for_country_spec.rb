require 'rails_helper'

RSpec.describe 'Recipes API' do

  describe 'happy path' do
    it 'returns a list of recipes from a specified country', :vcr do
      get '/api/v1/recipes?country=thailand'

      expect(response).to be_successful
      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to be_a Hash
      recipes[:data].each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to eq('null')

        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to eq('recipe')

        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to be_a Hash

        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes][:title]).to be_a String

        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes][:url]).to be_a String

        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes][:country]).to be_a String

        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes][:image]).to be_a String
      end
    end
  end

end