# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubytunes/version'

Gem::Specification.new do |spec|
  spec.name          = "rubytunes"
  spec.version       = RubyTunes::VERSION
  spec.authors       = ["Darren Cheng"]
  spec.email         = ["darren@thanx.com"]
  spec.summary       = "Ruby iTunes interface"
  spec.homepage      = "https://github.com/drn/rubytunes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
