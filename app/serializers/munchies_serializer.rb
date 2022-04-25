class MunchiesSerializer
  def self.potential_munch(destination, travel_time, restaurant, forecast)
{
  "data": {
    "id": "null",
    "type": "munchie",
    "attributes": {
      "destination_city": destination,
      "travel_time": travel_time,
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
end 