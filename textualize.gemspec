# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'textualize/version'

Gem::Specification.new do |spec|
  spec.name          = 'textualize'
  spec.version       = Textualize::VERSION
  spec.authors       = ['Q-Centrix Dev Team']
  spec.email         = ['devjobs@q-centrix.com']

  spec.summary       = 'Turn Documentation into Tests and More'
  spec.description   = <<-DESCRIPTION
    Textualize uses RAML for documentation and comes with scripts to generate
    template files that can be used to fulfill an implementation of your
    documentation.
  DESCRIPTION

  spec.homepage      = 'https://github.com/q-centrix/textualize'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n").reject do |file|
    file.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^bin/}) do |file|
    File.basename(file)
  end
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor',        '~> 0'
  spec.add_runtime_dependency 'attr_extras', '~> 4'
  spec.add_runtime_dependency 'hashie',      '~> 3'
  spec.add_runtime_dependency 'uglifier',      '~> 2'

  spec.add_development_dependency 'aruba',   '~> 0'
  spec.add_development_dependency 'byebug',  '~> 3'
  spec.add_development_dependency 'pry',     '~> 0'
  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3'
end
