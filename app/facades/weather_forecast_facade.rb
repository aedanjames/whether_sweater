class WeatherForecastFacade

  def self.forecast(latitude, longitude)
     data = WeatherForecastService.get_forecast(latitude, longitude)
     Forecast.new(data)
  end 
end