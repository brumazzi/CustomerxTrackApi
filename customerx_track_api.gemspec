lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'customerx_track_api/version'

Gem::Specification.new do |spec|
  spec.name                   = "customerx_track_api"
  spec.version                = GetnetApi::Version::STRING
  spec.platform               = Gem::Platform::RUBY
  spec.authors                = ["Daniel B. Brumazzi"]
  spec.email                  = ["brumazzi_daniel@yahoo.com.br"]
  spec.summary                = ""
  spec.description            = ""
  spec.homepage               = "https://github.com/brumazzi/CustomerxTrackApi"
  spec.license                = "MIT"

  spec.files                  = `git ls-files`.split($/)
  spec.executables            = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files             = spec.files.grep(%r{^(test|spec|features)/})

  spec.require_paths          = ["lib"]

  spec.required_ruby_version  = Gem::Requirement.new(">= 2.3.8")

  spec.add_dependency 'rest-client', '>= 1.7.3'

end