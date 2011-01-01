require 'rake'
require 'bundler'

begin
  Bundler.setup(:runtime, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift('lib')

require 'jeweler'
Jeweler::Tasks.new do |gemspec|
  gemspec.name = "polish"
  gemspec.summary = "Polish language support for Ruby and Rails"
  gemspec.email = "gkolodziejczyk@gmail.com"
  gemspec.homepage = "http://github.com/grk/polish"
  gemspec.authors = ["Grzesiek Kolodziejczyk"]

  gemspec.add_dependency("i18n", ">= 0.3.3")
end

Jeweler::GemcutterTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
task :default => :spec
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
  t.rspec_opts = %w(-fs --color)
end
 
