require 'spec_helper'

describe Geocoder do

  describe ".geocode_address" do
    it "returns nil when unsuccessful" do
      request = Geocoder::Request.new
      request.stub_chain(:response, :success?).and_return(false)
      Geocoder::Request.stub(:new).with(:address => 'foo').and_return(request)

      Geocoder.geocode_address('foo').should be_nil
    end

    it "returns results when successful" do
      request = Geocoder::Request.new
      request.stub_chain(:response, :success?).and_return(true)
      request.stub_chain(:response, :to_hash).and_return({'key' => 'value'})
      Geocoder::Request.stub(:new).with(:address => 'foo').and_return(request)

      Geocoder.geocode_address('foo').should == {'key' => 'value'}
    end

  end

end