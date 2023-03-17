class ImagePoro
  attr_reader :alt_desc,
              :url

  def initialize(image_data)
    @alt_desc = image_data[:alt]
    @url = image_data[:src][:original]
  end
end