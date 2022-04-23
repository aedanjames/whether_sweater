class BackgroundImageFacade
  def self.find_image(location)
    BackgroundImageService.get_image(location)
  end
end