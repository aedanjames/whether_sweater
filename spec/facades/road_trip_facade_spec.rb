require 'rails_helper'

RSpec.describe 'RoadTripFacade' do
 it ".road_trip (facade)", :vcr do
   trip = RoadTripFacade.road_trip("Sheridan,Co", "Englewood, Co")

  expect(trip).to be_a RoadTrip
  expect(trip.end_city).to eq("Englewood, CO")
  expect(trip.start_city).to eq("Sheridan, CO")
  expect(trip.travel_time).to be_a String
  end

 it ".road_trip (facade sad path)", :vcr do
   trip = RoadTripFacade.road_trip("Sheridan,Co", "Tokyo, Japan")

  expect(trip).to be_a Hash
  expect(trip[:data]).to be_a Hash
  expect(trip[:data][:message]).to eq("Impossible Route")
  end
end