module Geocoder
  class Response

    def initialize(http_response)
      @http_response = http_response
    end

    def success?
      response_successful? && status_ok?
    end

    def to_hash
      @to_hash ||= JSON.parse(raw_response)
    end

    private

    def response_successful?
      @http_response.is_a?(Net::HTTPSuccess)
    end

    def status_ok?
      to_hash['status'] == 'OK'
    end

    def raw_response
      @http_response.body
    end

  end
end