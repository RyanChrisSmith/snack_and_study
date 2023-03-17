require 'rails_helper'

RSpec.describe ImagesService do
  it 'retrieves images for the specified country', :vcr do
    images = ImagesService.get_images('canada')

    expect(images).to be_a Hash

    images[:photos].each do |image|
      expect(image).to have_key(:alt)
      expect(image[:src]).to have_key(:original)
    end
  end
end