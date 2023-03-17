require 'rails_helper'

RSpec.describe VideoService do 
  it 'returns an educational video from selected country', :vcr do
    video = VideoService.get_video('thailand')

    expect(video).to be_a Hash
    expect(video[:items][0][:id]).to have_key(:videoId)
    expect(video[:items][0][:snippet]).to have_key(:title)
  end
end