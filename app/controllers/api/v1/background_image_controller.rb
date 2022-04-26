class Api::V1::BackgroundImageController < ApplicationController
  before_action :params_check, :fetch_image

  def index
    image = BackgroundImageFacade.find_image(@location)
    render json: BackgroundImageSerializer.image(image, @location)
  end
  
private 

  def fetch_image
    @location = params[:location]
  end

  def params_check
    if params[:location].nil? || params[:location].empty?
      render json: { data: { message: ':location param missing' } }, status: 404
    end
  end
end