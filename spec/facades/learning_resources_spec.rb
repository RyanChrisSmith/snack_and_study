require 'rails_helper'

RSpec.describe LearningResourcesFacade do 
  it 'returns resources for the specific country', :vcr do
    result = LearningResourcesFacade.get_resources('thailand')

    expect(result).to be_a LearningResourcePoro
  end
end