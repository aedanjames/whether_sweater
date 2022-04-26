class RoadTrip
  attr_reader :start_city,:end_city,:travel_time

  def initialize(data)
    @start_city = "#{data[:route][:locations][0][:adminArea5]}, #{data[:route][:locations][0][:adminArea3]}"
    @end_city = "#{data[:route][:locations][1][:adminArea5]}, #{data[:route][:locations][1][:adminArea3]}"
    @travel_time = data[:route][:formattedTime]
  end

  def formatted_travel_time
    hours = @travel_time.slice(0..1)
    minutes = @travel_time.slice(3..4)
    "#{hours} hours, #{minutes} minutes"
  end

  def hours_to_arrival
    minutes_rounded = 0
    hours = @travel_time.slice(0..1).to_i
    minutes = @travel_time.slice(3..4).to_i
    if minutes >= 30
      minutes_rounded = 1
    elsif minutes < 30
      minutes_rounded = 0
    end 
    return hours + minutes_rounded - 1
  end
end