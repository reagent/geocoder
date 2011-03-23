require 'spec_helper'

describe Geocoder::Coordinates do

  context "with response data" do
    before do
      data = {'location' => {'lat' => 40, 'lng' => 70}}
      @coordinates = Geocoder::Coordinates.new(data)
    end

    it "knows the latitude from the response data" do
      @coordinates.lat.should == 40
    end

    it "knows the longitude" do
      @coordinates.lng.should == 70
    end
  end

end