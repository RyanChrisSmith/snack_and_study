require 'rails_helper'

RSpec.describe VideoPoro do
  it 'returns PORO from the api call' do
    video_data = {:kind=>"youtube#searchResult",
      :etag=>"7SF6tbP9Tdwqwjl7vm8sBI2mijg",
      :id=>{:kind=>"youtube#video", :videoId=>"OG_gKe9M7sY"},
      :snippet=>
      {:publishedAt=>"2023-03-17T10:44:37Z",
        :channelId=>"UC22f35dl6SIRTcamzjxVMUA",
        :title=>"Exploring Krabi In Thailand",
        :description=>
        "Krabi with its tourmaline seas, white-sand beaches, mangrove forests, limestone rock formations, hidden caves, and secret ...",
        :thumbnails=>
        {:default=>{:url=>"https://i.ytimg.com/vi/OG_gKe9M7sY/default.jpg", :width=>120, :height=>90},
          :medium=>{:url=>"https://i.ytimg.com/vi/OG_gKe9M7sY/mqdefault.jpg", :width=>320, :height=>180},
          :high=>{:url=>"https://i.ytimg.com/vi/OG_gKe9M7sY/hqdefault.jpg", :width=>480, :height=>360}},
        :channelTitle=>"Travel+Leisure India-South Asia",
        :liveBroadcastContent=>"none",
        :publishTime=>"2023-03-17T10:44:37Z"}}

    video = VideoPoro.new(video_data)

    expect(video).to be_a VideoPoro
    expect(video.title).to eq(video_data[:snippet][:title])
    expect(video.video_id).to eq(video_data[:id][:videoId])
  end
end