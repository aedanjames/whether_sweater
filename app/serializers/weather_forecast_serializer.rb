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
              "datetime": Time.at(forecast[:current][:dt]),
              "temp": forecast[:current][:temp],
              "feels_like": forecast[:current][:feels_like],
              "humidity": forecast[:current][:humidity],
              "sunrise": Time.at(forecast[:current][:sunrise]),
              "sunset": Time.at(forecast[:current][:sunset]),
              "uvi": forecast[:current][:uvi],
              "visibility": forecast[:current][:visibility],
              "conditions": forecast[:current][:weather][0][:description],
              "icon": forecast[:current][:weather][0][:icon]
            },
            "daily_weather": forecast[:daily].shift(5).map do |day|
                {
                  "datetime": Date.jd(day[:dt]),
                  "sunrise": Time.at(day[:sunrise]),
                  "sunset": Time.at(day[:sunset]),
                  "max_temp": day[:temp][:max],
                  "min_temp": day[:temp][:min],
                  "conditions": day[:weather][0][:description],
                  "icon": day[:weather][0][:icon]
                }
            end,
            "hourly_weather": forecast[:hourly].shift(8).map do |hour|
              {
              "time": Time.at(hour[:dt]),
              "temp": hour[:temp],
              "conditions": hour[:weather][0][:description],
              "icon": hour[:weather][0][:icon]
              }
            end
          },
      },
    }
  end
end