require 'rails_helper'

RSpec.describe RecipesService do
  describe 'it can retrieve the API' do
    it 'returns the first 20 recipes for a specific country', :vcr do
      recipes = RecipesService.find_recipes('thailand')

      expect(recipes).to be_a Hash

      recipes[:hits].each do |recipe|
        expect(recipe[:recipe]).to have_key(:label)
        expect(recipe[:recipe][:label]).to be_a String

        expect(recipe[:recipe]).to have_key(:uri)
        expect(recipe[:recipe][:uri]).to be_a String

        expect(recipe[:recipe]).to have_key(:image)
        expect(recipe[:recipe][:image]).to be_a String
      end
    end
  end
end