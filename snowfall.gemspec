# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snowfall/version'

Gem::Specification.new do |spec|
  spec.name          = "snowfall"
  spec.version       = Snowfall::VERSION
  spec.authors       = ["Taylor Smith"]
  spec.email         = ["mail@taylorsmith.net"]
  spec.description   = %q{A Ruby wrapper for OnTheSnow RSS feeds}
  spec.summary       = %q{A Ruby wrapper for OnTheSnow RSS feeds}
  spec.homepage      = "https://github.com/taylorsmith/snowfall"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.0"

  spec.add_development_dependency "bundler",      "~> 1.3"
  spec.add_development_dependency "rake",         "~> 10.1.0"
  spec.add_development_dependency "rspec",        "~> 2.14.1"
  spec.add_development_dependency "guard-rspec",  "~> 4.0.4"
  spec.add_development_dependency "simplecov",    "~> 0.8.1"
  spec.add_development_dependency "vcr",          "~> 2.7.0"
  spec.add_development_dependency "webmock",      "~> 1.15.2"
end

