# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'groove/version'
require 'rake'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-groove'
  spec.version       = Groove::VERSION
  spec.authors       = ['john muhl']
  spec.email         = ['me@johnmuhl.com']
  spec.summary       = 'FFI bindings to libgroove'
  spec.homepage      = 'http://github.com/johnmuhl/ruby-groove'
  spec.license       = 'MIT'
  spec.files         = FileList['lib/**/*.rb',
                                'test/**/*.rb',
                                'LICENSE.txt',
                                'README.md']
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'ffi', '~> 1.9'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'ffi_gen', '~> 1.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'yard', '~> 0.8'
end
