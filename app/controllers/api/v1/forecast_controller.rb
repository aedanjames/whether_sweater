class Api::V1::ForecastController < ApplicationController 
  before_action :params_check, :fetch_coordinates

  def index 
    forecast = WeatherForecastFacade.forecast(@coordinates[:lat], @coordinates[:lng])
    render json: WeatherForecastSerializer.weather(forecast)
  end 

private 

  def fetch_coordinates
    if params[:location].present?
      @coordinates = LocationFacade.coordinates(params[:location])
    end 
  end

  def params_check
    if params[:location].nil? || params[:location].empty?
      render json: { data: { message: ':location param missing' } }, status: 404
    end
  end 
end