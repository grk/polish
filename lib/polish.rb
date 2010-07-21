# -*- encoding: utf-8 -*- 
 
if RUBY_VERSION < "1.9"
  $KCODE = 'u'
end

$:.push File.join(File.dirname(__FILE__), 'polish')

# I18n require
unless defined?(I18n)
  $:.push File.join(File.dirname(__FILE__), 'vendor', 'i18n', 'lib')
  require 'i18n'
end


# Advanced backend
require 'backend/advanced'
 
# Rails hacks
if defined?(ActionView::Helpers)
  require 'action_view_ext/helpers/date_helper' 
end
 
module Polish
  extend self
  
  module VERSION
    MAJOR = 0
    MINOR = 0
    TINY  = 5
 
    STRING = [MAJOR, MINOR, TINY].join('.')
  end
  
  # Polish locale
  LOCALE = :'pl'
 
  # Polish locale
  def locale
    LOCALE
  end
  
  # Returns custom backend class for usage with Polish library
  # 
  # See I18n::Backend
  def i18n_backend_class
    I18n::Backend::Advanced
  end
  
  # Init Polish i18n: set custom backend, 
  # load all translations shipped with library.
  def init_i18n
    I18n.backend = Polish.i18n_backend_class.new
    I18n.load_path.unshift(*locale_files)
  end
 
  # See I18n::translate
  def translate(key, options = {})
    I18n.translate(key, options.merge({ :locale => LOCALE }))
  end        
  alias :t :translate
  
  # See I18n::localize
  def localize(object, options = {})
    I18n.localize(object, options.merge({ :locale => LOCALE }))
  end
  alias :l :localize
  
  # strftime() proxy with Polish localization
  def strftime(object, format = :default)
    localize(object, { :format => format })
  end
  
  # Simple pluralization proxy
  #
  # Usage: 
  #   Polish.pluralize(1, "dom", "domy", "domów")
  def pluralize(n, *variants)
    raise ArgumentError, "Must have a Numeric as a first parameter" unless n.is_a?(Numeric)
    raise ArgumentError, "Must have 3 variants for pluralization" if variants.size < 3
    variants_hash = pluralization_variants_to_hash(*variants)
    I18n.backend.send(:pluralize, LOCALE, variants_hash, n)
  end
  alias :p :pluralize
  
  protected
    # Returns all locale files shipped with library
    def locale_files
      Dir[File.join(File.dirname(__FILE__), "polish", "locale", "**/*")]
    end
    
    # Converts an array of pluralization variants to a Hash that can be used
    # with I18n pluralization.
    def pluralization_variants_to_hash(*variants)
      {
        :one => variants[0],
        :few => variants[1],
        :other => variants[2]
      }
    end
end
 
Polish.init_i18n
