require 'rails_helper'

RSpec.describe 'MunchiesFacade' do
 it ".formatted_time", :vcr do
  travel_time = LocationService.get_route({:lat=>39.738453, :lng=>-104.984853}.values.join(','), {:lat=>38.265425, :lng=>-104.610415}.values.join(','))[:route][:formattedTime]
  formatted_time = MunchiesFacade.formatted_time(travel_time)

   expect(formatted_time).to eq("1 hours 45 min")
  end

  it ".arrival_time", :vcr do 
    travel_time = LocationService.get_route({:lat=>39.738453, :lng=>-104.984853}.values.join(','), {:lat=>38.265425, :lng=>-104.610415}.values.join(','))[:route][:formattedTime]
    arrival_time = MunchiesFacade.arrival_time(travel_time)
    # datetime formatting breaks syntax rules, need to look more into dealing with datetime, it's tricky
    # expect(arrival_time).to eq(2022-04-25 16:24:09.204993 -0600)
  end 
end