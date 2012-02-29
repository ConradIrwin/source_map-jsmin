# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'source_map-jsmin'
  s.version = "0.1"

  s.authors = ["Conrad Irwin"]
  s.email = 'conrad.irwin@gmail.com'
  s.files = ["lib/source_map/jsmin.rb"]
  s.homepage = 'http://github.com/ConradIrwin/source_map-jsmin'
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.6")
  s.summary = "A ruby port of Douglas Crockford's jsmin, with support for generating source maps"
  s.description = "This is a hacked about version of Ryan Grove's original Ruby port of jsmin that adds" +
                  "support for generating a source map, using the source_map gem"
end
