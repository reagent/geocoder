require 'spec_helper'

describe Geocoder::Response do

  def http_response(http_response_successful, fixture_file = nil)
    http_response = nil

    if http_response_successful
      fixture_path = File.expand_path("../../../fixtures/#{fixture_file}", __FILE__)

      http_response = Net::HTTPOK.new('1.1', '200', 'OK')
      http_response.stub(:body).with().and_return(File.read(fixture_path))
    else
      http_response = Net::HTTPInternalServerError.new('1.1', '500', 'Internal Server Error')
    end

    http_response
  end

  describe "#to_hash" do
    it "has a status" do
      response = Geocoder::Response.new(http_response(true, 'response.ok.json'))
      response.to_hash['status'].should_not be_nil
    end

    it "has geometry" do
      response = Geocoder::Response.new(http_response(true, 'response.ok.json'))
      response.to_hash['results'][0]['geometry'].should_not be_nil
    end
  end

  describe "#success?" do
    it "returns false when the HTTP response is not successful" do
      response = Geocoder::Response.new(http_response(false))
      response.success?.should be_false
    end

    it "returns true when the status is 'OK'" do
      response = Geocoder::Response.new(http_response(true, 'response.ok.json'))
      response.success?.should be_true
    end

    it "returns false when the status is not 'OK'" do
      response = Geocoder::Response.new(http_response(true, 'response.zero_results.json'))
      response.success?.should be_false
    end
  end

end