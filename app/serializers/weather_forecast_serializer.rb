class WeatherForecastSerializer
  def self.weather(forecast)

    { "data":
      {
        "id": nil,
        "type": 'forecast',
        "attributes":
         {
            "current_weather":
            {
              "datetime": forecast.datetime,
              "temp": forecast.temp,
              "feels_like": forecast.feels_like,
              "humidity": forecast.humidity,
              "sunrise": Time.at(forecast.sunrise),
              "sunset": Time.at(forecast.sunset),
              "uvi": forecast.uvi,
              "visibility": forecast.visibility,
              "conditions": forecast.conditions,
              "icon": forecast.icon
            },
            "daily_weather": forecast.daily_weather.map do |day|
                {
                  "datetime": day.datetime,
                  "sunrise": day.sunrise,
                  "sunset": day.sunset,
                  "max_temp": day.max_temp,
                  "min_temp": day.min_temp,
                  "conditions": day.conditions,
                  "icon": day.icon
                }
            end,
            "hourly_weather": forecast.hourly_weather.map do |hour|
              {
              "time": hour.time,
              "temp": hour.temp,
              "conditions": hour.conditions,
              "icon": hour.icon
              }
            end
          },
      },
    }
  end
end