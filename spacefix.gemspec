# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spacefix/version"

Gem::Specification.new do |spec|
  spec.name          = "spacefix"
  spec.version       = Spacefix::VERSION
  spec.authors       = ["Konstantin Goryachev"]
  spec.email         = ["kevin.glare@gmail.com"]

  spec.summary       = 'Spacefix plugin'
  spec.description   = 'Spacefix plugin'
  spec.homepage      = 'Spacefix plugin'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'activesupport'
  spec.add_development_dependency 'bundler', '~> 2.0.2', '>= 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'

end
