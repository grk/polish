# encoding: UTF-8

require File.dirname(__FILE__) + '/../../spec_helper'

describe I18n, "Polish Date/Time localization" do
  before(:all) do
    @date = Date.parse("1985-12-01")
    @time = Time.local(1985, 12, 01, 16, 05)
  end

  describe "with date formats" do
    it "should use default format" do
      l(@date).should == "01.12.1985"
    end

    it "should use short format" do
      l(@date, :format => :short).should == " 1 gru."
    end

    it "should use long format" do
      l(@date, :format => :long).should == " 1 grudnia 1985"
    end
  end

  describe "with date day names" do
    it "should use day names" do
      l(@date, :format => "%d %B (%A)").should == "01 grudnia (niedziela)"
      l(@date, :format => "%d %B %Y roku była %A").should ==
                                          "01 grudnia 1985 roku była niedziela"
    end

    it "should use standalone day names" do
      l(@date, :format => "%A").should == "Niedziela"
      l(@date, :format => "%A, %d %B").should == "Niedziela, 01 grudnia"
    end

    it "should use abbreviated day names" do
      l(@date, :format => "%a").should == "Niedz."
      l(@date, :format => "%a, %d %b %Y").should == "Niedz., 01 gru. 1985"
    end
  end

  describe "with month names" do
    it "should use month names" do
      l(@date, :format => "%d %B").should == "01 grudnia"
      l(@date, :format => "%e %B %Y").should == " 1 grudnia 1985"
      l(@date, :format => "<b>%d</b> %B").should == "<b>01</b> grudnia"
      l(@date, :format => "<strong>%e</strong> %B %Y").should ==
                                            "<strong> 1</strong> grudnia 1985"
      l(@date, :format => "A było to dnia %ego miesiąca %B %Y").should ==
                                  "A było to dnia  1go miesiąca grudnia 1985"
    end

    it "should use standalone month names" do
      l(@date, :format => "%B").should == "Grudzień"
      l(@date, :format => "%B %Y").should == "Grudzień 1985"
    end

    it "should use abbreviated month names" do
      @date = Date.parse("1985-03-01")
      l(@date, :format => "%d %b").should == "01 mar."
      l(@date, :format => "%e %b %Y").should == " 1 mar. 1985"
    end

    it "should use standalone abbreviated month names" do
      @date = Date.parse("1985-03-01")
      l(@date, :format => "%b").should == "Mar."
      l(@date, :format => "%b %Y").should == "Mar. 1985"
    end
  end

  it "should define default date components order: year, month, day" do
    I18n.backend.translate(Polish.locale, :"date.order").should ==
                                                        [:day, :month, :year]
  end

  describe "with time formats" do
    it "should use default format" do
      l(@time).should =~ /^Niedz.,  1 grudnia 1985, 16:05:00/
    end

    it "should use short format" do
      l(@time, :format => :short).should == " 1 gru., 16:05"
    end

    it "should use long format" do
      l(@time, :format => :long).should == " 1 grudnia 1985, 16:05"
    end

    it "should define am and pm" do
      I18n.backend.translate(Polish.locale, :"time.am").should_not be_nil
      I18n.backend.translate(Polish.locale, :"time.pm").should_not be_nil
    end
  end

  describe "with time distances" do
    before do
      @now = Time.now
      @three_minutes_from_now = @now + 3 * 60
      @hour_ago = @now - 60 * 60
    end

    # it "should translate distance of time in words" do
    #   distance_of_time_in_words(@now, @three_minutes_from_now).should == "3 minuty"
    # end

  end

  protected
    def l(object, options = {})
      I18n.l(object, options.merge( { :locale => Polish.locale }))
    end
end
