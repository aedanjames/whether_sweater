class RoadTripSerializer
  def self.road_trip(road_trip, forecast)

    { "data":
      {
        "id": nil,
        "type": "roadtrip",
        "attributes":
        {
          "start_city": road_trip.start_city,
          "end_city": road_trip.end_city,
          "travel_time": road_trip.travel_time,
          "weather_at_eta":
          {
            "temperature": forecast.hourly_weather[road_trip.hours_to_arrival_index].temp,
            "conditions": forecast.hourly_weather[road_trip.hours_to_arrival_index].conditions
          }
        }
      }
    }
  end
end