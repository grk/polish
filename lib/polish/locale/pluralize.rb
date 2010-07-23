# -*- encoding: utf-8 -*- 

{
  :'pl' => {
    :i18n => {
      :plural => {
        :rule => lambda { |n| 
          # taken from http://unicode.org/repos/cldr-tmp/trunk/diff/supplemental/language_plural_rules.html
          # TODO: check if they're really wrong about 22..24
          #
          #   one -> n is 1;
          #   few -> n mod 10 in 2..4 and n mod 100 not in 12..14;
          #   other -> everything else
          #
          n == 1 ? :one : [2, 3, 4].include?(n % 10) && 
                          ![12, 13, 14].include?(n % 100) ? :few : :other 
        }
      }
    }
  }
}
