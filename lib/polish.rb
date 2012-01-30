# -*- encoding: utf-8 -*-

if RUBY_VERSION < "1.9"
  $KCODE = 'u'
end

require 'i18n'

require 'polish/version'

# Rails hacks
if defined?(ActionView::Helpers)
  require 'polish/action_view_ext/helpers/date_helper'
end

require 'polish/proxies'

module Polish
  extend self

  # Polish locale
  LOCALE = :'pl'

  # Polish locale
  def locale
    LOCALE
  end

  # Init Polish i18n: set custom backend,
  # load all translations shipped with library.
  def init_i18n
    I18n.backend.class.send(:include, I18n::Backend::Pluralization)
    I18n.load_path.unshift(*locale_files)
  end

  protected
    # Returns all locale files shipped with library
    def locale_files
      Dir[File.join(File.dirname(__FILE__), "polish", "locale", "**/*")]
    end
end

Polish.init_i18n
