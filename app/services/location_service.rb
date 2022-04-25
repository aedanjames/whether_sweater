class LocationService
  def self.connection 
    url = "http://www.mapquestapi.com/geocoding/v1/address"
    Faraday.new(url: url) do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
    end 
  end 

  def self.get_coordinates(location)
    response = connection.get do |faraday|
      faraday.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end 

  def self.route_connection
    url = "http://www.mapquestapi.com/directions/v2/route"
    Faraday.new(url: url) do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
    end 
  end

  def self.get_route(from, to)
    response = route_connection.get do |faraday|
      faraday.params['from'] = from
      faraday.params['to'] = to
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end