require 'rails_helper'

RSpec.describe RecipesFacade do
  it '#.get_all_recipes', :vcr do
    recipes_for_country = RecipesFacade.get_all_recipes('thailand')

    expect(recipes_for_country).to be_a Array
    expect(recipes_for_country).to all(be_a RecipePoro)
    expect(recipes_for_country.count).to eq 20
  end
end