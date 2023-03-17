class VideoPoro
  attr_reader :title,
              :video_id

  def initialize(video_data)
    @title = video_data[:snippet][:title]
    @video_id = video_data[:id][:videoId]
  end
end