class RoadTripFacade
  def self.road_trip(to, from)
    data = RoadTripService.get_trip_route(to,from)
    if data[:info][:statuscode] == 402
      { data: { message: 'Impossible Route' } }
    else 
    RoadTrip.new(data)
    end 
  end 
end