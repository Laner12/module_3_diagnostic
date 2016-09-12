class Search < ActiveRecord::Base

  def initalize
    @connection = Faraday.new("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?")
    @connection.headers["X-Api-Key"] = "ENV[api_key]"
  end

  def location_call(location)
    response = @connection.get "location=#{locaiton}&fuel_type=LPG&fuel_type=ELEC&radius=0.0 to 6.0"
    parse(response.body)
  end

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
