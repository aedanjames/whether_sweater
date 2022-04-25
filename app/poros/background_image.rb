class BackgroundImage
  attr_reader :image_url, :source, :author, :logo
  
  def initialize(data)
    @image_url = data[:photos][0][:url]
    @source = data[:photos][0][:photographer_url]
    @author = data[:photos][0][:photographer]
    @logo = data[:photos][0][:src][:tiny]
  end 
end