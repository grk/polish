# -*- encoding: utf-8 -*- 
 
module I18n
  module Backend
    # Advanced I18n backend.
    #
    # Extends Simple backend. Allows usage of "standalone" keys
    # for DateTime localization and usage of user-defined Proc (lambda) pluralization
    # methods in translation tables.
    class Advanced < Simple
      include I18n::Backend::Pluralization

      LOCALIZE_ABBR_MONTH_NAMES_MATCH = /(%d|%e)(.*)(%b)/
      LOCALIZE_MONTH_NAMES_MATCH = /(%d|%e)(.*)(%B)/
      LOCALIZE_STANDALONE_ABBR_DAY_NAMES_MATCH = /^%a/
      LOCALIZE_STANDALONE_DAY_NAMES_MATCH = /^%A/
      
      # Acts the same as +strftime+, but returns a localized version of the 
      # formatted date string. Takes a key from the date/time formats 
      # translations as a format argument (<em>e.g.</em>, <tt>:short</tt> in <tt>:'date.formats'</tt>).
      #
      # Note that it differs from <tt>localize</tt> in Simple< backend by checking for 
      # "standalone" month name/day name keys in translation and using them if available.
      #
      # <tt>options</tt> parameter added for i18n-0.3 compliance.
      def localize(locale, object, format = :default, options = nil)
        raise ArgumentError, "Object must be a Date, DateTime or Time object. #{object.inspect} given." unless object.respond_to?(:strftime)
        type = object.respond_to?(:sec) ? 'time' : 'date'

        if Symbol === format
          key = format
          type = object.respond_to?(:sec) ? 'time' : 'date'
          format = I18n.t(:"#{type}.formats.#{key}", :locale => locale, :raise => true)
        end

        format = resolve(locale, object, format, options).to_s.dup
 
        if lookup(locale, :"date.standalone_abbr_day_names")
          format.gsub!(LOCALIZE_STANDALONE_ABBR_DAY_NAMES_MATCH, 
            I18n.t(:"date.standalone_abbr_day_names", :locale => locale, :format => format)[object.wday])
        end
        format.gsub!(/%a/, I18n.t(:"date.abbr_day_names", :locale => locale, :format => format)[object.wday])
        
        if lookup(locale, :"date.standalone_day_names")
          format.gsub!(LOCALIZE_STANDALONE_DAY_NAMES_MATCH, 
            I18n.t(:"date.standalone_day_names", :locale => locale, :format => format)[object.wday])
        end
        format.gsub!(/%A/, I18n.t(:"date.day_names", :locale => locale, :format => format)[object.wday])
 
        if lookup(locale, :"date.standalone_abbr_month_names")
          format.gsub!(LOCALIZE_ABBR_MONTH_NAMES_MATCH) do
            $1 + $2 + I18n.t(:"date.abbr_month_names", :locale => locale, :format => format)[object.mon]
          end
          format.gsub!(/%b/, I18n.t(:"date.standalone_abbr_month_names", :locale => locale, :format => format)[object.mon])
        else
          format.gsub!(/%b/, I18n.t(:"date.abbr_month_names", :locale => locale, :format => format)[object.mon])
        end
 
        if lookup(locale, :"date.standalone_month_names")
          format.gsub!(LOCALIZE_MONTH_NAMES_MATCH) do
            $1 + $2 + I18n.t(:"date.month_names", :locale => locale, :format => format)[object.mon]
          end
          format.gsub!(/%B/, I18n.t(:"date.standalone_month_names", :locale => locale, :format => format)[object.mon])
        else
          format.gsub!(/%B/, I18n.t(:"date.month_names", :locale => locale, :format => format)[object.mon])
        end
 
        format.gsub!(/%p/, I18n.t(:"time.#{object.hour < 12 ? :am : :pm}", :locale => locale, :format => format)) if object.respond_to? :hour

        object.strftime(format)
      end
    end
  end
end
