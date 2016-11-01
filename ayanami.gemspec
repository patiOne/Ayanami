# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ayanami/version'

Gem::Specification.new do |spec|
  spec.name          = 'ayanami'
  spec.version       = Ayanami::VERSION
  spec.authors       = ['Kaisar Arkhan']
  spec.email         = ['ykno@protonmail.com']

  spec.summary       = 'A Telegram Bot API that focuses on simplicity'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/patiwan/Ayanami'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
