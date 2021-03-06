module Geocoder
  class Request

    attr_accessor :additional_parameters

    def self.get(parameters = {})
      new(parameters).response
    end

    def initialize(parameters = {})
      self.additional_parameters = parameters
    end

    def endpoint_url
      "#{base_url}?#{query}"
    end

    def endpoint
      URI.parse(endpoint_url)
    end

    def response
      @response ||= Response.new(Net::HTTP.get_response(endpoint))
    end

    private

    def base_url
      'http://maps.googleapis.com/maps/api/geocode/json'
    end

    def query
      parameters.map {|k,v| "#{k}=#{CGI.escape(v)}" }.join('&')
    end

    def parameters
      default_parameters.merge(additional_parameters)
    end

    def default_parameters
      {:sensor => 'false'}
    end

  end
end