$:.push File.expand_path('../lib', __FILE__)
require 'bag/version'

Gem::Specification.new do |s|
  s.name        = 'bag-ruby'
  s.version     = Bag::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Tom Pesman']
  s.email       = ['tom@tnux.net']
  s.homepage    = 'https://github.com/9to5/bag-ruby'
  s.summary     = %q{Gem to access the BAG API}
  s.description = %q{Gem to access the BAG API}

  s.add_runtime_dependency 'httparty'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'

  s.files         = Dir['README.md', 'lib/**/*']
  s.test_files    = Dir['spec/**/*']
  s.require_paths = ['lib']
end
