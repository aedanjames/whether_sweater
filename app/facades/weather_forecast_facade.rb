class WeatherForecastFacade

  def self.forecast(latitude, longitude, travel_time = nil)

     data = WeatherForecastService.get_forecast(latitude, longitude)

     if travel_time
      Forecast.new(data, travel_time)
     elsif travel_time == nil
      Forecast.new(data)
     end
  end 
end