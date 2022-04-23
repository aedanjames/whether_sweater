class Api::V1::ForecastController < ApplicationController 
  before_action :fetch_coordinates

  def index 
    forecast = WeatherForecastFacade.forecast(@coordinates[:lat], @coordinates[:lng])
    render json: WeatherForecastSerializer.weather(forecast)
  end 

private 

  def fetch_coordinates
    if params[:location]
      @coordinates = LocationFacade.coordinates(params[:location])
    end 
  end
end