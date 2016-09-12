class SearchController < ApplicationController

  def index
    binding.pry
    locaiton = params["q"].to_i
    result = location_call(location)
  end
end
