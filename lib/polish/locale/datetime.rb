# -*- encoding: utf-8 -*- 

{
  :'pl' => {
    :date => {
      :month_names => lambda { |date_or_time, opts|
        if opts[:format] =~ /(%d|%e)(.*)(%B)/
          [nil, 'stycznia', 'lutego', 'marca', 'kwietnia', 'maja', 'czerwca', 
           'lipca', 'sierpnia', 'września', 'października', 'listopada', 
           'grudnia']
        else
          [nil, 'Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 
           'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 
           'Grudzień']
        end
      },
      :abbr_month_names => lambda { |date_or_time, opts|
        if opts[:format] =~ /(%d|%e)(.*)(%b)/
          [nil, 'sty.', 'lut.', 'mar.', 'kwi.', 'maj.', 'cze.', 'lip.', 'sie.', 
           'wrz.', 'paź.', 'lis.', 'gru.']
        else
          [nil, 'Sty.', 'Lut.', 'Mar.', 'Kwi.', 'Maj', 'Cze.', 'Lip.', 'Sie.', 
           'Wrz.', 'Paź.', 'Lis.', 'Gru.']
        end
      },
      :day_names => lambda { |date_or_time, opts|
        if opts[:format] =~ /^%A/
          ['Niedziela', 'Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 
           'Piątek', 'Sobota']
        else
          ['niedziela', 'poniedziałek', 'wtorek', 'środa', 'czwartek', 
           'piątek', 'sobota']
        end
      },
      :abbr_day_names => lambda { |date_or_time, opts|
        if opts[:format] =~ /^%a/
          ['Niedz.', 'Pon.', 'Wt.', 'Śr.', 'Czw.', 'Pt.', 'Sob.']
        else
          ['niedz.', 'pon.', 'wt.', 'śr.', 'czw.', 'pt.', 'sob.']
        end
      }
    }
  }
}
