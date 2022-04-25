require 'rails_helper'

RSpec.describe 'Yelp Service' do
  it 'returns a response', :vcr do
      connection = YelpService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns info about a business', :vcr do
    coordinates = LocationFacade.coordinates("Highland, California")
    time = Time.now.to_i
    business = YelpService.get_business(coordinates[:lat], coordinates[:lng], "Chinese", time)

    expect(business).to be_a Hash
    expect(business[:businesses]).to be_a Array
    business[:businesses].each do |business|

      expect(business).to be_a Hash
      expect(business[:id]).to be_a String
      expect(business[:alias]).to be_a String
      expect(business[:name]).to be_a String
      expect(business[:coordinates]).to be_a Hash
      expect(business[:coordinates][:latitude]).to be_a Float
      expect(business[:coordinates][:longitude]).to be_a Float
      expect(business[:location]).to be_a Hash
      expect(business[:location][:address1]).to be_a String
      expect(business[:location][:city]).to be_a String
      expect(business[:location][:zip_code]).to be_a String
      expect(business[:location][:state]).to be_a String
      expect(business[:location][:display_address]).to be_a Array
    end
  end
end