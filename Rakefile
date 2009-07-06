require 'rake'
require 'spec/rake/spectask'
require 'echoe'

Echoe.new('pdf_reader', '0.0.1') do |p|
  p.description     = "PDF reader"
  p.url             = "http://github.com/finalist/pdf_reader"
  p.author          = "Diederick Lawson"
  p.email           = "diederick@finalist.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

desc 'Default: run specs.'
task :default => :spec

desc 'Run the specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = ['--colour --format progress --loadby mtime --reverse']
  t.spec_files = FileList['spec/**/*_spec.rb']
end
