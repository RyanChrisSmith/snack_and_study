require 'rails_helper'

RSpec.describe 'Recipes PORO' do
  it 'can get the info needed to make a PORO' do
    country = 'thailand'
    recipe_data = {
      recipe: {
        label: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
        uri: 'https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html',
        image: 'https://fakeimage'
      }
    }

    final = RecipePoro.new(recipe_data, country)

    expect(final).to be_a RecipePoro
    expect(final.title).to eq(recipe_data[:recipe][:label])
    expect(final.url).to eq(recipe_data[:recipe][:url])
    expect(final.image).to eq(recipe_data[:recipe][:image])
    expect(final.country).to eq(country)
    expect(final.instance_variables).to eq(%i[@title @url @image @country])
  end
end