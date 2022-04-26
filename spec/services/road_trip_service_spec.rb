require 'rails_helper'

RSpec.describe 'RoadTripService' do
  it 'establishes a successful connection', :vcr do
      connection = RoadTripService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns ', :vcr do
    from = "Sheridan,Co"
    to = "Englewood, Co"
    trip = RoadTripService.get_trip_route(from, to)
    expect(trip).to be_a(Hash)
    expect(trip).to have_key(:route)
    expect(trip[:route]).to have_key(:formattedTime)
    expect(trip[:route]).to have_key(:locations)
  end
end