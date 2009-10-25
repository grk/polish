Polish
======
Polish language support for Ruby on Rails.

Adds correct polish pluralization and better date formats. Also includes support for standalone months. (`"%B %Y"` should be Grudzień 2009, but `"%d. %B %Y"` should be 24. grudnia 2009).

Based on [Russian](http://github.com/yaroslav/russian/) by [yaroslav](http://github.com/yaroslav/).

Install
-------
Install as a gem:

in `config/environment.rb`:

    Rails::Initializer.run do |config|
      config.gem 'polish', :source => 'http://gemcutter.org'
    end

and then:
    rake gems:install


or a plugin:

    script/plugin install git://github.com/grk/polish.git


Then, magic happens. No need to set default locale.


Overrides
---------
Translations and date formats can be overridden in `config/locales/pl.yml`
