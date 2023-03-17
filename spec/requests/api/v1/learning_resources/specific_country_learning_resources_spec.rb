require 'rails_helper'

RSpec.describe 'Learning Resources API' do
  describe 'learning resources endpoint for specific country' do
    it 'returns an informational video title, link, and random images for the cournty specified' do
      get '/api/v1/learning_resources?country=laos'

      require 'pry' ; binding.pry
    end
  end
end