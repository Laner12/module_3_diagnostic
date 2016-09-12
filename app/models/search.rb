class Search < ActiveRecord::Base
  def location_call(zip-code)
    response = Faraday.new("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?location=#{zip-code}&fuel_type=LPG&fuel_type=ELEC&radius=0.0 to 6.0")
    
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
