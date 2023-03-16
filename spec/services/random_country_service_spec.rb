require 'rails_helper'

RSpec.describe RandomCountryService do
  it 'can retrieve a random country' do
    one_country = RandomCountryService.random_search

    expect(one_country).to be_a String
  end
end