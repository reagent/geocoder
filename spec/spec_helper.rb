# http://sneaq.net/textmate-wtf
$:.reject! { |e| e.include? 'TextMate' }

require 'rubygems'
require 'bundler/setup'

require File.expand_path('../../lib/geocoder', __FILE__)