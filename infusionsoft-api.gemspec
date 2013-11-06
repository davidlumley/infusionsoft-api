# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'infusionsoft/api/version'

Gem::Specification.new do |spec|
  spec.name          = "infusionsoft-api"
  spec.version       = Infusionsoft::Api::VERSION
  spec.authors       = ["David Lumley"]
  spec.email         = ["david@davidlumley.com.au"]
  spec.description   = %q{Infusionsoft API}
  spec.summary       = %q{Infusionsoft API}
  spec.homepage      = "https://github.com/davidlumley/infusionsoft-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
