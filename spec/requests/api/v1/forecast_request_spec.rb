require 'rails_helper'

RSpec.describe 'get /forecast' do 
  it 'returns json data', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/forecast', headers: headers, params: { location: "sheridan,co" }
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(forecast).to be_a Hash
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temp)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    expect(forecast[:data][:attributes][:daily_weather].count).to eq(5)
    expect(forecast[:data][:attributes][:daily_weather][0]).to be_a Hash
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:max_temp)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:min_temp)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:daily_weather][0]).to have_key(:icon)
    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)

    expect(forecast[:data][:attributes]).to_not have_key(:minutely)

    expect(forecast[:data][:attributes][:hourly_weather].count).to eq(8)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:temp)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
  end

  it 'returns a useful repsonse if location param is missing or empty', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    get '/api/v1/forecast', headers: headers, params: { location: "" }
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(forecast).to be_a Hash
    expect(forecast[:data][:message]).to eq(":location param missing")

  end
end