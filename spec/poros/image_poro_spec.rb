require 'rails_helper'

RSpec.describe ImagePoro do
  it 'returns PORO from api call' do
    image_data = {
      "id": 3393546,
      "width": 3573,
      "height": 5360,
      "url": "https://www.pexels.com/photo/man-standing-outside-a-prayer-temple-3393546/",
      "photographer": "Nick Wehrli",
      "photographer_url": "https://www.pexels.com/@oidonnyboy",
      "photographer_id": 1803654,
      "avg_color": "#958478",
      "src": {
          "original": "https://images.pexels.com/photos/3393546/pexels-photo-3393546.jpeg",
          "large2x": "https://images.pexels.com/photos/3393546/pexels-photo-3393546.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          "large": "https://images.pexels.com/photos/3393546/pexels-photo-3393546.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "medium": "https://images.pexels.com/photos/3393546/pexels-photo-3393546.jpeg?auto=compress&cs=tinysrgb&h=350",
          "small": "https://images.pexels.com/photos/3393546/pexels-photo-3393546.jpeg?auto=compress&cs=tinysrgb&h=130",
          "portrait": "https://images.pexels.com/photos/3393546/pexels-photo-3393546.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
          "landscape": "https://images.pexels.com/photos/3393546/pexels-photo-3393546.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
          "tiny": "https://images.pexels.com/photos/3393546/pexels-photo-3393546.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"
      },
      "liked": false,
      "alt": "Man Standing Outside a Prayer Temple"
    }

    image = ImagePoro.new(image_data)

    expect(image).to be_a ImagePoro
    expect(image.alt_desc).to eq(image_data[:alt])
    expect(image.url).to eq(image_data[:src][:original])
  end
end