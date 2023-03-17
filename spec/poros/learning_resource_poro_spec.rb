require 'rails_helper'

RSpec.describe LearningResourcePoro do 
  it 'combines video, images, and country', :vcr do
    country = 'switzerland'
    results = VideoService.get_video(country)
    video = results[:items].map do |video_data|
      VideoPoro.new(video_data)
    end

    response = ImagesService.get_images(country)
    images = response[:photos].map do |image_data|
      ImagePoro.new(image_data)
    end

    final = LearningResourcePoro.new(country, video, images)

    expect(final.country).to eq(country)
    expect(final.video).to eq(video)
    expect(final.images).to eq(images)
  end
end