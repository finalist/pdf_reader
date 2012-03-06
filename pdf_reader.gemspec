# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pdf_reader/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Diederick Lawson"]
  gem.email         = ["diederick@finalist.com"]
  gem.description   = %q{Extracts raw text from PDF}
  gem.summary       = %q{Extracts raw text from PDF}
  gem.homepage      = "https://github.com/finalist/pdf_reader"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "pdf_reader"
  gem.require_paths = ["lib"]
  gem.version       = PDFReader::VERSION

  gem.add_development_dependency 'rspec'
end
