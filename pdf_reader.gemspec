# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pdf_reader}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Diederick Lawson"]
  s.date = %q{2009-07-06}
  s.description = %q{PDF Reader}
  s.email = %q{diederick@finalist.com}
  s.extra_rdoc_files = ["lib/pdf_reader.rb", "README.rdoc"]
  s.files = ['Manifest', 'Rakefile', 'README.rdoc', 'MIT-LICENSE', 'pdf_reader.gemspec', 'lib/pdf_reader.rb', 'spec/pdf_reader_spec.rb', 'spec/test.html', 'spec/test.pdf']
  s.homepage = %q{http://github.com/finalist/pdf_reader}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Pdf_reader", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pdf_reader}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{PDF Reader}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
