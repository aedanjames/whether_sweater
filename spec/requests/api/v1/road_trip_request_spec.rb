require 'rails_helper'
RSpec.describe 'session request' do
  it 'returns a road trip json response when valid API key is given', :vcr do
    data = {
      "email": "scoopdoop@protonmail.com",
      "password": "password",
      "password_confirmation": "password"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)

    user_register = JSON.parse(response.body, symbolize_names: true)
    login_data = {
      "email": "scoopdoop@protonmail.com",
      "password": "password",
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(login_data)
    user = JSON.parse(response.body, symbolize_names: true)

    body = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": user[:data][:attributes][:api_key]
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(road_trip).to be_a Hash
    expect(road_trip[:data]).to be_a Hash
    expect(road_trip[:data][:id]).to eq(nil)
    expect(road_trip[:data][:type]).to eq("roadtrip")
    expect(road_trip[:data][:attributes]).to be_a Hash
    expect(road_trip[:data][:attributes][:start_city]).to eq("Denver, CO")
    expect(road_trip[:data][:attributes][:end_city]).to eq("Pueblo, CO")
    expect(road_trip[:data][:attributes][:travel_time]).to be_a String
    expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a Hash
    expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a Float
    expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
  end

  it 'returns useful response for invalid API key', :vcr do
    data = {
      "email": "scoopdoop@protonmail.com",
      "password": "password",
      "password_confirmation": "password"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)
    user_register = JSON.parse(response.body, symbolize_names: true)
    data_login = {
      "email": "scoopdoop@protonmail.com",
      "password": "password",
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(data_login)
    user = JSON.parse(response.body, symbolize_names: true)
    body = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "1234"
    }
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(road_trip[:data]).to have_key(:message)
    expect(road_trip[:data][:message]).to eq("Invalid API Key")
  end
end
