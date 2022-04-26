class RoadTripService
  def self.connection
    url = "http://www.mapquestapi.com/directions/v2/route"
    Faraday.new(url: url) do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
    end
  end

  def self.get_trip_route(from, to)
    response = connection.get do |faraday|
      faraday.params['from'] = from
      faraday.params['to'] = to
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end