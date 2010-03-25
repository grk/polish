# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{polish}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Grzesiek Kolodziejczyk"]
  s.autorequire = %q{polish}
  s.date = %q{2010-03-25}
  s.description = %q{Polish language support for Ruby and Rails}
  s.email = %q{gkolodziejczyk@gmail.com}
  s.extra_rdoc_files = ["README.md", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.md", "Rakefile", "TODO", "init.rb", "lib/polish", "lib/polish/action_view_ext", "lib/polish/action_view_ext/helpers", "lib/polish/action_view_ext/helpers/date_helper.rb", "lib/polish/backend", "lib/polish/backend/advanced.rb", "lib/polish/locale", "lib/polish/locale/actionview.yml", "lib/polish/locale/activerecord.yml", "lib/polish/locale/activesupport.yml", "lib/polish/locale/datetime.yml", "lib/polish/locale/pluralize.rb", "lib/polish.rb", "lib/vendor", "lib/vendor/i18n", "lib/vendor/i18n/CHANGELOG.textile", "lib/vendor/i18n/i18n.gemspec", "lib/vendor/i18n/lib", "lib/vendor/i18n/lib/i18n", "lib/vendor/i18n/lib/i18n/backend", "lib/vendor/i18n/lib/i18n/backend/base.rb", "lib/vendor/i18n/lib/i18n/backend/cache.rb", "lib/vendor/i18n/lib/i18n/backend/chain.rb", "lib/vendor/i18n/lib/i18n/backend/fallbacks.rb", "lib/vendor/i18n/lib/i18n/backend/gettext.rb", "lib/vendor/i18n/lib/i18n/backend/pluralization.rb", "lib/vendor/i18n/lib/i18n/backend/simple.rb", "lib/vendor/i18n/lib/i18n/exceptions.rb", "lib/vendor/i18n/lib/i18n/gettext.rb", "lib/vendor/i18n/lib/i18n/helpers", "lib/vendor/i18n/lib/i18n/helpers/gettext.rb", "lib/vendor/i18n/lib/i18n/locale", "lib/vendor/i18n/lib/i18n/locale/fallbacks.rb", "lib/vendor/i18n/lib/i18n/locale/tag", "lib/vendor/i18n/lib/i18n/locale/tag/parents.rb", "lib/vendor/i18n/lib/i18n/locale/tag/rfc4646.rb", "lib/vendor/i18n/lib/i18n/locale/tag/simple.rb", "lib/vendor/i18n/lib/i18n/locale/tag.rb", "lib/vendor/i18n/lib/i18n/string.rb", "lib/vendor/i18n/lib/i18n.rb", "lib/vendor/i18n/MIT-LICENSE", "lib/vendor/i18n/Rakefile", "lib/vendor/i18n/README.textile", "lib/vendor/i18n/test", "lib/vendor/i18n/test/all.rb", "lib/vendor/i18n/test/api", "lib/vendor/i18n/test/api/basics.rb", "lib/vendor/i18n/test/api/interpolation.rb", "lib/vendor/i18n/test/api/lambda.rb", "lib/vendor/i18n/test/api/link.rb", "lib/vendor/i18n/test/api/localization", "lib/vendor/i18n/test/api/localization/date.rb", "lib/vendor/i18n/test/api/localization/date_time.rb", "lib/vendor/i18n/test/api/localization/lambda.rb", "lib/vendor/i18n/test/api/localization/time.rb", "lib/vendor/i18n/test/api/pluralization.rb", "lib/vendor/i18n/test/api/translation.rb", "lib/vendor/i18n/test/backend", "lib/vendor/i18n/test/backend/cache", "lib/vendor/i18n/test/backend/cache/cache_test.rb", "lib/vendor/i18n/test/backend/chain", "lib/vendor/i18n/test/backend/chain/api_test.rb", "lib/vendor/i18n/test/backend/chain/chain_test.rb", "lib/vendor/i18n/test/backend/fallbacks", "lib/vendor/i18n/test/backend/fallbacks/api_test.rb", "lib/vendor/i18n/test/backend/fallbacks/fallbacks_test.rb", "lib/vendor/i18n/test/backend/pluralization", "lib/vendor/i18n/test/backend/pluralization/api_test.rb", "lib/vendor/i18n/test/backend/pluralization/pluralization_test.rb", "lib/vendor/i18n/test/backend/simple", "lib/vendor/i18n/test/backend/simple/all.rb", "lib/vendor/i18n/test/backend/simple/api_test.rb", "lib/vendor/i18n/test/backend/simple/lookup_test.rb", "lib/vendor/i18n/test/backend/simple/setup.rb", "lib/vendor/i18n/test/backend/simple/translations_test.rb", "lib/vendor/i18n/test/fixtures", "lib/vendor/i18n/test/fixtures/locales", "lib/vendor/i18n/test/fixtures/locales/de.po", "lib/vendor/i18n/test/fixtures/locales/en.rb", "lib/vendor/i18n/test/fixtures/locales/en.yml", "lib/vendor/i18n/test/fixtures/locales/plurals.rb", "lib/vendor/i18n/test/gettext", "lib/vendor/i18n/test/gettext/api_test.rb", "lib/vendor/i18n/test/gettext/backend_test.rb", "lib/vendor/i18n/test/i18n_exceptions_test.rb", "lib/vendor/i18n/test/i18n_load_path_test.rb", "lib/vendor/i18n/test/i18n_test.rb", "lib/vendor/i18n/test/locale", "lib/vendor/i18n/test/locale/fallbacks_test.rb", "lib/vendor/i18n/test/locale/tag", "lib/vendor/i18n/test/locale/tag/rfc4646_test.rb", "lib/vendor/i18n/test/locale/tag/simple_test.rb", "lib/vendor/i18n/test/string_test.rb", "lib/vendor/i18n/test/test_helper.rb", "lib/vendor/i18n/test/with_options.rb", "lib/vendor/i18n/vendor", "lib/vendor/i18n/vendor/po_parser.rb", "lib/vendor/i18n/VERSION", "spec/fixtures", "spec/fixtures/en.yml", "spec/fixtures/pl.yml", "spec/i18n", "spec/i18n/locale", "spec/i18n/locale/datetime_spec.rb", "spec/i18n/locale/pluralization_spec.rb", "spec/locale_spec.rb", "spec/polish_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/grk/polish/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Polish language support for Ruby and Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
