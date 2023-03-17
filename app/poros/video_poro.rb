class VideoPoro
  attr_reader :title,
              :video_id

  def initialize(video_data)
    @title = video_data[:items][0][:snippet][:title]
    @video_id = video_data[:items][0][:id][:videoId]
  end
end