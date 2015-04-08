# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'textualize/version'

Gem::Specification.new do |spec|
  spec.name          = "textualize"
  spec.version       = Textualize::VERSION
  spec.authors       = ["Nicholas Shook"]
  spec.email         = ["nshook@q-centrix.com"]

  spec.summary       = %q{Turn Documentation into Tests and More}
  spec.description   = %q{Textualize currently supports converting RAML
  documentation into rack-test request specs, angular js factories, and rails
  seeding}
  spec.homepage      = "https://github.com/q-centrix/textualize"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor',          '~> 0'

  spec.add_development_dependency 'aruba',  '~> 0'
  spec.add_development_dependency 'byebug', '~> 3'
  spec.add_development_dependency 'pry',    '~> 0'
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
