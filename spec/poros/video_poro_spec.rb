require 'rails_helper'

RSpec.describe VideoPoro do
  it 'returns PORO from the api call' do
    video_data = {
      "kind": 'youtube#searchListResponse',
      "etag": 'Z-e4awW0RjOQTDEnSGRuUeY_Gcs',
      "nextPageToken": 'CAEQAA',
      "regionCode": 'US',
      "pageInfo": {
        "totalResults": 1000000,
        "resultsPerPage": 1
      },
      "items": [
        {
          "kind": 'youtube#searchResult',
          "etag": 'NFwReidvzJVeYTZvZs6SR1m8DIo',
          "id": {
            "kind": 'youtube#video',
            "videoId": 'NDf33fhwNko'
          },
          "snippet": {
            "publishedAt": '2023-03-14T10:42:06Z',
            "channelId": 'UCoiCnYFpCc8IvRJEuoIg_wQ',
            "title": 'The Living Hell? Gastarbeiter in Thailand',
            "description": 'An die 4 Millionen Gast- oder Fremdarbeiter aus den Ländern Burma (Myanmar), Laos und Kambodscha sind in Thailand ...',
            "thumbnails": {
              "default": {
                "url": 'https://i.ytimg.com/vi/NDf33fhwNko/default.jpg',
                "width": 120,
                "height": 90
              },
              "medium": {
                  "url": 'https://i.ytimg.com/vi/NDf33fhwNko/mqdefault.jpg',
                  "width": 320,
                  "height": 180
                },
              "high": {
                  "url": 'https://i.ytimg.com/vi/NDf33fhwNko/hqdefault.jpg',
                  "width": 480,
                  "height": 360
                }
            },
            "channelTitle": 'Siam Rider',
            "liveBroadcastContent": 'none',
            "publishTime": '2023-03-14T10:42:06Z'
          }
        }
      ]
    }

    video = VideoPoro.new(video_data)

    expect(video).to be_a VideoPoro
    expect(video.title).to eq(video_data[:items][0][:snippet][:title])
    expect(video.video_id).to eq(video_data[:items][0][:id][:videoId])
  end
end