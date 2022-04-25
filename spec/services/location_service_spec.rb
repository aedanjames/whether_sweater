require 'rails_helper'

RSpec.describe 'Location Service' do
  it 'returns a response', :vcr do
      connection = LocationService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns a connection for get_route connection', :vcr do
      connection = LocationService.route_connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns longitude and latitude coorindates', :vcr do
    coordinates = LocationService.get_coordinates("Sheridan,CO")

    expect(coordinates).to be_a Hash
    expect(coordinates[:results]).to be_a Array
    expect(coordinates[:results][0]).to be_a Hash
    expect(coordinates[:results][0][:locations]).to be_a Array
    expect(coordinates[:results][0][:locations][0]).to be_a Hash
    expect(coordinates[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(coordinates[:results][0][:locations][0][:latLng]).to have_key(:lng)
  end

  it 'returns the route given from and to params', :vcr do
    route = LocationService.get_route("39.64821 -104.98796", "39.64693 -105.02506")
    expect(route[:route]).to be_a Hash
    expect(route[:route][:formattedTime]).to be_a String

  end
end
