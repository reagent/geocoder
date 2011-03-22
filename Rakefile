require 'rubygems'
require 'rake/gempackagetask'

require File.join(File.dirname(__FILE__), %w(lib geocoder version))

spec = Gem::Specification.new do |s|
  s.name             = 'geocoder'
  s.version          = Geocoder::Version.to_s
  s.has_rdoc         = true
  s.extra_rdoc_files = %w(README.rdoc)
  s.rdoc_options     = %w(--main README.rdoc)
  s.summary          = "Simple geocoder client"
  s.author           = 'Patrick Reagan'
  s.email            = 'reaganpr@gmail.com'
  s.homepage         = 'http://sneaq.net'
  s.files            = %w(README.rdoc Rakefile) + Dir.glob("{lib,test}/**/*")
  # s.executables    = ['geocoder']

  # s.add_dependency('gem_name', '~> 0.0.1')

  s.add_development_dependency('rake', '~> 0.8.0')
  s.add_development_dependency('bundler', '~> 1.0.0')
  s.add_development_dependency('rspec', '~> 2.0')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new

  task :default => :spec
rescue LoadError => ignore_me
end

desc 'Generate the gemspec for this Gem'
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end

