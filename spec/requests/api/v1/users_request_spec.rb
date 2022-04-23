require 'rails_helper'
RSpec.describe 'users request' do
  it 'returns a json response' do
    data = {
      "email": "scoopdoop@protonmail.com",
      "password": "password",
      "password_confirmation": "password"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    post '/api/v1/users', headers: headers, params: JSON.generate(data)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'returns error message if email is already taken' do
    user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

   headers = { 'Content-Type': 'application/json' }
   params = {
     "email": "whatever@example.com",
     "password": "password",
     "password_confirmation": "password"
   }
   post '/api/v1/users', headers: headers, params: JSON.generate(params)

   invalid = JSON.parse(response.body, symbolize_names: true)

   expect(response).to have_http_status(401)
   expect(invalid[:data][:message]).to eq('Email has already been taken')
  end

  it 'returns error message if invalid authentication params given' do
   headers = { 'Content-Type': 'application/json' }
   params = {
     "email": "whatever@example.com",
     "password": "password",
     "password_confirmation": "fastword"
   }
   post '/api/v1/users', headers: headers, params: JSON.generate(params)

   invalid = JSON.parse(response.body, symbolize_names: true)

   expect(response).to have_http_status(401)
   expect(invalid[:data][:message]).to eq('Invalid Email/Password')
  end
end
