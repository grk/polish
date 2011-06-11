# Polish
[![travis-ci](http://travis-ci.org/grk/polish.png)](http://travis-ci.org/grk/polish) [![stillmaintained](http://stillmaintained.com/grk/polish.png)](http://stillmaintained.com/grk/polish)

Polish language support for Ruby on Rails.

Adds correct polish pluralization and better date formats. Also includes support for standalone months. (`"%B %Y"` should be Grudzień 2009, but `"%d. %B %Y"` should be 24. grudnia 2009).

Based on [Russian](http://github.com/yaroslav/russian/) by [yaroslav](http://github.com/yaroslav/).

Install
-------
*Warning*: as of version 0.1.0, polish is only tested with Rails 3 and Bundler. Use with caution, might give unexpected results.

To add Polish to your Rails app, simply add it to your Gemfile:

`gem "polish", ">= 0.1.0"`

Additionally, if you change the backend of I18n, you will need to make sure it includes the Pluralization module:

`I18n.backend.class.send(:include, I18n::Backend::Pluralization)`

What it does
------------

The main feature of polish is fixing the date formats. It does that by setting the date.month\_names and date.day\_names translations to Procs that can detect the proper form.

Polish also adds correct pluralization rules.

Overrides
---------
Translations and date formats can be overridden in `config/locales/pl.yml`
