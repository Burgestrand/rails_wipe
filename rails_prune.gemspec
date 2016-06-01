# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_prune/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_prune"
  spec.version       = RailsPrune::VERSION
  spec.authors       = ["Kim Burge Strand"]
  spec.email         = ["kim@burgestrand.se"]

  spec.summary       = %q{A rake task for Rails to truncate your database.}
  spec.homepage      = "https://github.com/Burgestrand/rails_prune"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
