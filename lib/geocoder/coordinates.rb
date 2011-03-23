module Geocoder
  class Coordinates

    def initialize(geometry_data)
      @geometry_data = geometry_data
    end

    def lat
      location_data['lat']
    end

    def lng
      location_data['lng']
    end

    private

    def location_data
      @geometry_data['location']
    end

  end
end