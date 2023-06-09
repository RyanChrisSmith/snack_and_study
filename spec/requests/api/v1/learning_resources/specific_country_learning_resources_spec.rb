require 'rails_helper'

RSpec.describe 'Learning Resources API' do
  describe 'learning resources endpoint for specific country' do
    it 'returns an informational video title, link, and random images for the cournty specified', :vcr do
      get '/api/v1/learning_resources?country=laos'

      expect(response).to be_successful
      resources = JSON.parse(response.body, symbolize_names:true)

      expect(resources).to be_a Hash
      expect(resources).to have_key(:data)
      expect(resources[:data]).to have_key(:id)
      expect(resources[:data][:id]).to eq('null')

      expect(resources[:data]).to have_key(:type)
      expect(resources[:data][:type]).to eq('learning_resource')

      expect(resources[:data]).to have_key(:attributes)
      expect(resources[:data][:attributes]).to have_key(:country)
      expect(resources[:data][:attributes][:country]).to eq('laos')

      expect(resources[:data][:attributes]).to have_key(:video)

      expect(resources[:data][:attributes][:video]).to have_key(:title)
      expect(resources[:data][:attributes][:video][:title]).to be_a String
      expect(resources[:data][:attributes][:video]).to have_key(:video_id)
      expect(resources[:data][:attributes][:video][:video_id]).to be_a String
      expect(resources[:data][:attributes][:images]).to be_a Array

      resources[:data][:attributes][:images].each do |image|
        expect(image).to have_key(:alt_desc)
        expect(image[:alt_desc]).to be_a String
        expect(image).to have_key(:url)
        expect(image[:url]).to be_a String
      end
    end

    it 'returns empty objects if the search country doesnt exist', :vcr do
      get '/api/v1/learning_resources?country=jlkjlkjlkasdfalskdjf'

      expect(response).to be_successful
      empty = JSON.parse(response.body, symbolize_names: true)

      expect(empty).to have_key(:data)
      expect(empty[:data]).to have_key(:id)
      expect(empty[:data][:id]).to eq('null')
      expect(empty[:data][:type]).to eq('learning_resource')
      expect(empty[:data][:attributes][:country]).to eq('jlkjlkjlkasdfalskdjf')
      expect(empty[:data][:attributes][:video]).to eq({})
      expect(empty[:data][:attributes][:images]).to eq([])
    end
  end
end