$:.unshift File.dirname(__FILE__)

require 'cgi'
require 'net/http'
require 'json'

require 'geocoder/request'
require 'geocoder/response'
require 'geocoder/coordinates'

module Geocoder

  def self.geocode_address(address)
    request = Request.new(:address => address)
    request.response.to_hash if request.response.success?
  end

end
