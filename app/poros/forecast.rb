class Forecast
  attr_reader :datetime,:temp,:feels_like,:humidity,:sunrise,:sunset,:uvi,:visibility,:conditions,:icon,:daily_weather,:hourly_weather
  def initialize(data)
    @datetime = Time.at(data[:current][:dt])
    @temp = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @sunrise = data[:current][:sunrise]
    @sunset = data[:current][:sunset]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]

    @daily_weather = data[:daily].shift(5).map do |day|
      DailyWeather.new(day)
    end 
    @hourly_weather = data[:hourly].shift(8).map do |hour|
      HourlyWeather.new(hour)
    end
  end
end