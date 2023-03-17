class ImagesService

  def self.get_images(country)
    response = conn.get('/v1/search?') do |req|
      req.params['query'] = "#{country}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: 'https://api.pexels.com') do |f|
      f.headers['Authorization'] = ENV['images_key']
      f.params['per_page'] = '10'
    end
  end
end