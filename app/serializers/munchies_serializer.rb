class MunchiesSerializer
  def self.potential_munch(destination, travel_time, restaurant, forecast)
{
  "data": {
    "id": "null",
    "type": "munchie",
    "attributes": {
      "destination_city": destination,
      "travel_time": formatted_time(travel_time),
      "forecast": {
        "summary": forecast[:current][:weather][0][:description],
        "temperature": "#{forecast[:current][:temp]}"
      },
      "restaurant": {
        "name": restaurant[:businesses][0][:name],
        "address": restaurant[:businesses][0][:location][:display_address].join(',')
      }
    }
  }
}
  end 

  def self.arrival_time(travel_time)
    minutes_rounded = 0
    time = travel_time
    hours = time.slice(0..1).to_i
    minutes = time.slice(3..4).to_i
    if minutes < 30
      minute_round = 0
    elsif minutes >= 30
      minute_round = 1
    end
    total = hours + minutes_rounded
    t = Time.now
    t2 = t + total*60*60
  end

  def self.formatted_time(travel_time)
    hours = travel_time.slice(0..1).to_i
    minutes = travel_time.slice(3..4).to_i
    travel_time = "#{hours} hours #{minutes} min"
    return travel_time
  end
end 