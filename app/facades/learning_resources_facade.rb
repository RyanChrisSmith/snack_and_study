class LearningResourcesFacade

  def self.get_resources(country)
    results = VideoService.get_video(country)
    video = results[:items].map do |video_data|
      VideoPoro.new(video_data)
    end

    response = ImagesService.get_images(country)
    images = response[:photos].map do |image_data|
      ImagePoro.new(image_data)
    end

    LearningResourcePoro.new(country, video, images)
  end
end