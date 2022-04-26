class Api::V1::RoadTripController < ApplicationController
  before_action :validate_api_key, :fetch_coordinates

  def create
    if validate_api_key
      road_trip = RoadTripFacade.road_trip(params[:origin], params[:destination])
      forecast = WeatherForecastFacade.forecast(@coordinates[:lat], @coordinates[:lng])
      render json: RoadTripSerializer.road_trip(road_trip,forecast)
    elsif validate_api_key == nil
      bad_api_key
    end
  end

private
  def validate_api_key
    @user = User.find_by(auth_token: params[:api_key])
  end

  def fetch_coordinates
    if params[:destination]
      @coordinates = LocationFacade.coordinates(params[:destination])
    end 
  end

  def bad_api_key
    render json: { data: { message: 'Invalid API Key' } }, status: 401
  end
end