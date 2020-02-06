require "date"

RSpec.describe I18n, "Polish Date/Time localization" do
  before(:all) do
    @date = Date.parse("1985-12-01")
    @time = Time.local(1985, 12, 01, 16, 05)
  end

  describe "with date formats" do
    it "should use default format" do
      expect(l(@date)).to eq "01.12.1985"
    end

    it "should use short format" do
      expect(l(@date, :format => :short)).to eq " 1 gru."
    end

    it "should use long format" do
      expect(l(@date, :format => :long)).to eq " 1 grudnia 1985"
    end
  end

  describe "with date day names" do
    it "should use day names" do
      expect(l(@date, :format => "%d %B (%A)")).to eq "01 grudnia (niedziela)"
      expect(l(@date, :format => "%d %B %Y roku była %A")).to eq "01 grudnia 1985 roku była niedziela"
    end

    it "should use standalone day names" do
      expect(l(@date, :format => "%A")).to eq "Niedziela"
      expect(l(@date, :format => "%A, %d %B")).to eq "Niedziela, 01 grudnia"
    end

    it "should use abbreviated day names" do
      expect(l(@date, :format => "%a")).to eq "Niedz."
      expect(l(@date, :format => "%a, %d %b %Y")).to eq "Niedz., 01 gru. 1985"
    end
  end

  describe "with month names" do
    it "should use month names" do
      expect(l(@date, :format => "%d %B")).to eq "01 grudnia"
      expect(l(@date, :format => "%e %B %Y")).to eq " 1 grudnia 1985"
      expect(l(@date, :format => "<b>%d</b> %B")).to eq "<b>01</b> grudnia"
      expect(l(@date, :format => "<strong>%e</strong> %B %Y")).
        to eq "<strong> 1</strong> grudnia 1985"
      expect(l(@date, :format => "A było to dnia %ego miesiąca %B %Y")).
        to eq "A było to dnia  1go miesiąca grudnia 1985"
    end

    it "should use standalone month names" do
      expect(l(@date, :format => "%B")).to eq "Grudzień"
      expect(l(@date, :format => "%B %Y")).to eq "Grudzień 1985"
    end

    it "should use abbreviated month names" do
      @date = Date.parse("1985-03-01")
      expect(l(@date, :format => "%d %b")).to eq "01 mar."
      expect(l(@date, :format => "%e %b %Y")).to eq " 1 mar. 1985"
    end

    it "should use standalone abbreviated month names" do
      @date = Date.parse("1985-03-01")
      expect(l(@date, :format => "%b")).to eq "Mar."
      expect(l(@date, :format => "%b %Y")).to eq "Mar. 1985"
    end
  end

  it "should define default date components order: year, month, day" do
    expect(I18n.backend.translate(Polish.locale, :"date.order")).to eq [:day, :month, :year]
  end

  describe "with time formats" do
    it "should use default format" do
      expect(l(@time)).to match(/^Niedz.,  1 grudnia 1985, 16:05:00/)
    end

    it "should use short format" do
      expect(l(@time, :format => :short)).to eq " 1 gru., 16:05"
    end

    it "should use long format" do
      expect(l(@time, :format => :long)).to eq " 1 grudnia 1985, 16:05"
    end

    it "should define am and pm" do
      expect(I18n.backend.translate(Polish.locale, :"time.am")).to_not be_nil
      expect(I18n.backend.translate(Polish.locale, :"time.pm")).to_not be_nil
    end
  end

  describe "with time distances" do
    before do
      @now = Time.now
      @three_minutes_from_now = @now + 3 * 60
      @hour_ago = @now - 60 * 60
    end

    # it "should translate distance of time in words" do
    #   expect(distance_of_time_in_words(@now, @three_minutes_from_now)).to eq "3 minuty"
    # end

  end

  protected
    def l(object, options = {})
      I18n.l(object, options.merge( { :locale => Polish.locale }))
    end
end
