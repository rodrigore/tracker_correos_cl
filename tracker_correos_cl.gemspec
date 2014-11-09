# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tracker_correos_cl/version'

Gem::Specification.new do |spec|
  spec.name          = "tracker_correos_cl"
  spec.version       = TrackerCorreosCl::VERSION
  spec.authors       = ["Rodrigo Campos Guzmán"]
  spec.email         = ["rodrigopcg@gmail.com"]
  spec.summary       = %q{Get the Tracking information from correos.cl from a Tracking a number}
  spec.description   = %q{Fetch, parse and display the Tracking information from the site correos.cl according a Tracking number}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri', "~> 1.6"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
