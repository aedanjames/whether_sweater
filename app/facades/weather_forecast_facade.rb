class WeatherForecastFacade
  def self.forecast(latitude, longitude)
    WeatherForecastService.get_forecast(latitude, longitude)
  end 
end