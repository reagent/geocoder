require 'spec_helper'

describe Geocoder::Request do

  describe ".get" do
    it "returns a response" do
      request = Geocoder::Request.new
      request.stub(:response).with().and_return('response')

      Geocoder::Request.stub(:new).with(:address => 'foo').and_return(request)

      Geocoder::Request.get(:address => 'foo').should == 'response'
    end
  end

  describe "#endpoint_url" do
    it "knows the base URL" do
      request = Geocoder::Request.new
      request.endpoint_url.should == 'http://maps.googleapis.com/maps/api/geocode/json?sensor=false'
    end

    it "appends the address to the URL" do
      request = Geocoder::Request.new(:address => '12 Main Street, Anytown, CO')
      request.endpoint_url.should == 'http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=12+Main+Street%2C+Anytown%2C+CO'
    end
  end

  describe "#endpoint" do
    it "generates it from the URL" do
      request = Geocoder::Request.new
      request.endpoint.should == URI.parse('http://maps.googleapis.com/maps/api/geocode/json?sensor=false')
    end
  end

  describe "#response" do
    it "creates it from a raw HTTP request" do
      Net::HTTP.stub(:get_response).with('endpoint').and_return('http_response')
      Geocoder::Response.stub(:new).with('http_response').and_return('response')

      request = Geocoder::Request.new
      request.stub(:endpoint).with().and_return('endpoint')

      request.response.should == 'response'
    end
  end

end