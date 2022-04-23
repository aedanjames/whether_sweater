require 'rails_helper'
RSpec.describe 'forecast request' do
  it 'returns json data about an image result', :vcr do

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/backgrounds', headers: headers, params: { location: "denver" }
    image = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(image).to have_key(:data)
    expect(image[:data]).to have_key(:id)
    expect(image[:data]).to have_key(:type)
    expect(image[:data]).to have_key(:attributes)
    expect(image[:data][:attributes]).to have_key(:image)
    expect(image[:data][:attributes]).to have_key(:credit)
    expect(image[:data][:attributes][:image]).to have_key(:location)
    expect(image[:data][:attributes][:image]).to have_key(:image_url)
    expect(image[:data][:attributes][:credit]).to have_key(:source)
    expect(image[:data][:attributes][:credit]).to have_key(:author)
    expect(image[:data][:attributes][:credit]).to have_key(:logo)

    expect(image[:data][:attributes]).to_not have_key(:width)
    expect(image[:data][:attributes]).to_not have_key(:height)
    expect(image[:data][:attributes]).to_not have_key(:avg_color)
    expect(image[:data][:attributes]).to_not have_key(:liked)

  end

  it 'returns 404 if given invalid params', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/backgrounds', headers: headers, params: { photo: "ksdkjas" }
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end
end