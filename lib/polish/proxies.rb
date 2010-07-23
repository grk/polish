module Polish
  module Proxies
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

  include Proxies
end
