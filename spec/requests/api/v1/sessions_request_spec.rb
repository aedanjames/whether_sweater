require 'rails_helper'
RSpec.describe 'users login request' do
  it 'returns a json response' do
    user_1 = User.create!(email: "scoopdoop@protonmail.com", password: "password", password_confirmation: "password")

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    params = {
      "email": "scoopdoop@protonmail.com",
      "password": "password"
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)
    
    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'returns error message if authentication fails' do
    user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

    headers = { 'Content-Type': 'application/json' }
    params = {
      "email": "whatever@example.com",
      "password": "fastword"
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)
 
    invalid = JSON.parse(response.body, symbolize_names: true)
 
    expect(response).to have_http_status(401)
    expect(invalid[:data][:message]).to eq('Invalid Email/Password')
  end
end
