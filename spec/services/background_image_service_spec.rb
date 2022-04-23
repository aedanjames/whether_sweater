require 'rails_helper'

RSpec.describe 'Background Image Service' do
  it 'returns a response', :vcr do
      connection = LocationService.connection
      expect(connection).to be_a(Faraday::Connection)
  end

  it 'returns an image based upon a search query', :vcr do
    image = BackgroundImageService.get_image("Denver")

    expect(image).to be_a Hash
    expect(image[:photos]).to be_a Array
    expect(image[:photos][0]).to be_a Hash
    expect(image[:photos][0][:id]).to be_a Integer
    expect(image[:photos][0][:width]).to be_a Integer
    expect(image[:photos][0][:height]).to be_a Integer
    expect(image[:photos][0][:url]).to be_a String
    expect(image[:photos][0][:src]).to be_a Hash
    expect(image[:photos][0][:src][:original]).to be_a String
  end
end