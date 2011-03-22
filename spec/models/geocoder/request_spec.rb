require 'spec_helper'

describe Geocoder::Request do

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

end