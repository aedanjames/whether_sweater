class RoadTripFacade
  def self.road_trip(to, from)
    data = RoadTripService.get_trip_route(to,from)
    RoadTrip.new(data)
  end 
end