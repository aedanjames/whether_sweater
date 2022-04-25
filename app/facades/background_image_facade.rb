class BackgroundImageFacade
  def self.find_image(location)
    data = BackgroundImageService.get_image(location)
    BackgroundImage.new(data)
  end
end