class Api::V1::MunchiesController < ApplicationController 
  before_action :fetch_coordinates

  def index
    travel_time = LocationService.get_route(@start_coordinates.values.join(','), @destination_coordinates.values.join(','))[:route][:formattedTime]
    formatted_travel_time = MunchiesFacade.formatted_time(travel_time)
    arrival_time = MunchiesFacade.arrival_time(travel_time)
    restaurant = YelpService.get_business(@destination_coordinates[:lat], @destination_coordinates[:lng], params[:food], formatted_travel_time)
    # binding.pry
    forecast = WeatherForecastFacade.forecast(@destination_coordinates[:lat], @destination_coordinates[:lng])
    render json: MunchiesSerializer.potential_munch(params[:destination], travel_time, restaurant, forecast)
  end 

private 

  def fetch_coordinates
    if params[:start] && params[:destination]
      @start_coordinates = LocationFacade.coordinates(params[:start])
      @destination_coordinates = LocationFacade.coordinates(params[:destination])
    end 
  end
end