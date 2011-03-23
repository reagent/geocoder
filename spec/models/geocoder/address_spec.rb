require 'spec_helper'

describe Geocoder::Address do

  it "can fetch a response" do
    address = Geocoder::Address.new('foobar')
    Geocoder::Request.stub(:get).with(:address => 'foobar').and_return('data')

    address.response.should == 'data'
  end

  it "can fetch response data" do
    data = {'results' => ['result']}
    address = Geocoder::Address.new('foobar')
    address.stub(:response).with().and_return(stub(:to_hash => data))

    address.data.should == 'result'
  end

  it "knows the coordinates" do
    address = Geocoder::Address.new('foobar')
    address.stub(:data).with().and_return({'geometry' => 'value'})
    Geocoder::Coordinates.stub(:new).with('value').and_return('coordinates')

    address.coordinates.should == 'coordinates'
  end

end