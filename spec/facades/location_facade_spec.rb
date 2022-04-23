require 'rails_helper'

RSpec.describe 'LocationFacade' do
 it ".coordinates", :vcr do
   coordinates = LocationFacade.coordinates("Sheridan,Co")

   expect(coordinates).to eq({:lat=>39.64935, :lng=>-105.025038})
  end
end