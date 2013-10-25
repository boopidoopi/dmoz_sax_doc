# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.dirname(__FILE__) + '/lib/dmoz_sax/version'

Gem::Specification.new do |gem|
  gem.name          = "dmoz_sax_doc"
  gem.version       = DmozSax::VERSION
  gem.authors       = ["Galen Palmer"]
  gem.email         = ["palmergs@gmail.com"]
  gem.description   = %q{Use a SAX parser to visit either the structure.u8 or content.u8 DMOZ files.}
  gem.summary       = %q{SAX visitor for DMOZ structure of content files.}
  gem.homepage      = "https://github.com/palmergs/dmoz_sax_doc"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'nokogiri', '~> 1.5'
  gem.add_dependency 'json', '~> 1.7'

  gem.add_development_dependency 'rspec', '~> 2.12'
end
