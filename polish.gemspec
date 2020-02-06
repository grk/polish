require_relative 'lib/polish/version'

Gem::Specification.new do |s|
  s.name = %q{polish}
  s.version = Polish::VERSION

  s.authors = ["Grzesiek Kolodziejczyk"]
  s.email = %q{gkolodziejczyk@gmail.com}
  s.homepage = %q{http://github.com/grk/polish}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.summary = %q{Polish language support for Ruby and Rails}

  s.add_dependency "i18n"

  s.add_development_dependency "rake"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec", ">= 2.8.0"
end

