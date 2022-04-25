require 'rails_helper'

RSpec.describe 'WeatherForecastFacade' do

 it ".forecast", :vcr do
    data = {:lat=>39.644450, :lng=>-105.006450}
    forecast = WeatherForecastFacade.forecast(data[:lat], data[:lng])

    expect(forecast.conditions).to be_a String
    expect(forecast.daily_weather).to be_a Array
    expect(forecast.hourly_weather).to be_a Array
    expect(forecast.datetime).to be_a Time
    expect(forecast.humidity).to be_a Integer
    expect(forecast.icon).to be_a String
    expect(Time.at(forecast.sunrise)).to be_a Time
    expect(Time.at(forecast.sunset)).to be_a Time
    forecast.daily_weather.each do |day|
      expect(day.conditions).to be_a String
      expect(day.datetime).to be_a Date
      expect(day.max_temp).to be_a Float
      expect(day.min_temp).to be_a Float
      expect(day.sunrise).to be_a Time
      expect(day.sunset).to be_a Time
    end 

    forecast.hourly_weather.each do |hour|
      expect(hour.conditions).to be_a String
      expect(hour.icon).to be_a String
      expect(hour.temp).to be_a Float
      expect(hour.time).to be_a Time
    end 
  end
end