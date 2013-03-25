# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nerv/version'

Gem::Specification.new do |spec|
  spec.name          = 'nerv'
  spec.version       = Nerv::VERSION
  spec.authors       = ['Max Riveiro']
  spec.email         = ['kavu13@gmail.com']
  spec.description   = %q{Environment Variables for Humans. Ruby Edition!}
  spec.summary       = %q{Environment Variables for Humans. Ruby Edition!}
  spec.homepage      = 'https://github.com/kavu/nerv'
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec',   '~> 2.13'
  spec.add_development_dependency 'yard',    '~> 0.8.5'
end
