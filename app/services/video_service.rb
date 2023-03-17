class VideoService

  def self.get_video(country)
    response = conn.get('youtube/v3/search?') do |req|
      req.params['q'] = "#{country}"
    end
    result = JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: 'https://youtube.googleapis.com') do |f|
      f.params['key'] = ENV['video_key']
      f.params['part'] = 'snippet'
      f.params['maxResults'] = '1'
      f.params['type'] = 'video'
      f.params['order'] = 'rating'
      f.params['safeSearch'] = 'strict'
    end
  end
end