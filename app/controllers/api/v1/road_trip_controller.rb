class Api::V1::RoadTripController < ApplicationController
  before_action :params_check, :validate_api_key, :fetch_coordinates

  def create
    road_trip = RoadTripFacade.road_trip(params[:origin], params[:destination])

    if validate_api_key && road_trip.class == RoadTrip
      forecast = WeatherForecastFacade.forecast(@coordinates[:lat], @coordinates[:lng], road_trip.travel_time)
      render json: RoadTripSerializer.road_trip(road_trip,forecast)
    elsif validate_api_key == nil
      bad_api_key
    elsif road_trip[:data][:message] == "Impossible Route"
      render json: road_trip, status: 404
    end
  end

private


  def params_check
    if params[:origin].nil? || params[:origin].empty? || params[:api_key].nil? || params[:api_key].empty?
      render json: { data: { message: ':origin or :api_key params missing or empty' } }, status: 401
    end
  end

  def validate_api_key
    @user = User.find_by(auth_token: params[:api_key])
  end

  def fetch_coordinates
    if params[:destination].present?
      @coordinates = LocationFacade.coordinates(params[:destination])
    else 
      render json: { data: { message: ':destination param missing or empty' } }, status: 401
    end 
  end

  def bad_api_key
    render json: { data: { message: 'Invalid API Key' } }, status: 401
  end
end