module Geocoder
  class Address

    def initialize(address)
      @address = address
    end

    def response
      Request.get(:address => @address)
    end

    def data
      response.to_hash['results'].first
    end

    def coordinates
      @coordinates ||= Coordinates.new(data['geometry'])
    end

  end
end