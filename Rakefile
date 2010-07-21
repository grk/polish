require 'rubygems'
require 'rake/gempackagetask'
require 'spec/rake/spectask'
require 'rubygems/specification'
require 'date'
require 'I18n'
 
GEM = "polish"
GEM_VERSION = "0.0.5"
AUTHOR = "Grzesiek Kolodziejczyk"
EMAIL = "gkolodziejczyk@gmail.com"
HOMEPAGE = "http://github.com/grk/polish/"
SUMMARY = "Polish language support for Ruby and Rails"
 
spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.md", "LICENSE", "TODO"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  
  s.add_dependency "i18n", ">=0.3.3"
  
  s.require_path = 'lib'
  s.files = %w(LICENSE README.md Rakefile TODO) + Dir.glob("{lib,spec,rails}/**/*")
end
 
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
 
task :default => :spec
desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end
 
desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end
 
desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
