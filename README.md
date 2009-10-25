Polish
======
Polish language support for Ruby on Rails.

Based on [Russian](http://github.com/yaroslav/russian/) by [yaroslav](http://github.com/yaroslav/).

Usage
-----
Install as a gem
`
Rails::Initializer.run do |config|
  config.gem 'polish', :source => 'http://gemcutter.org'
end
`
or a plugin
`
script/plugin install git://github.com/grk/polish.git
`

Then, magic happens. No need to set default locale.


Overrides
---------
Translations and date formats can be overridden in `config/locales/pl.yml`
