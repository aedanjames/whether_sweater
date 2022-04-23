require 'rails_helper'

RSpec.describe 'Location Service' do
  it 'returns a response', :vcr do
      connection = LocationService.connection
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
end
