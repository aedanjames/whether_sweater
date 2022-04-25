class YelpService
  def self.connection
    url = "https://api.yelp.com/v3/businesses/search"
    Faraday.new(url: url) do |faraday|
      faraday.headers['Authorization'] = "Bearer #{ENV['yelp_api_key']}"
    end
  end

  def self.get_business(latitude, longitude, food, arrival_time = nil)
    response = connection.get do |faraday|
      faraday.params['latitude'] = latitude
      faraday.params['longitude'] = longitude
      faraday.params['term'] = "#{food}"
      faraday.params['categories'] = ("#{food}, All")
      # faraday.params['open_at'] = arrival_time
    end
    JSON.parse(response.body, symbolize_names: true)
  end 
end