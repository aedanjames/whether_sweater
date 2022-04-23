class Api::V1::BackgroundImageController < ApplicationController
  before_action :fetch_image

  def index
    image = BackgroundImageFacade.find_image(@location)
    render json: BackgroundImageSerializer.image(image, @location)
  end
  
private 

  def fetch_image
    if params[:location]
      @location = params[:location]
    else 
      render status: 404
    end 
  end 
end