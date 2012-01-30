# encoding: UTF-8

require File.dirname(__FILE__) + '/spec_helper'

describe Polish, "VERSION" do
  it "should be defined" do
    Polish::VERSION.should be_a(String)
  end
end

describe Polish do
  describe "with locale" do
    it "should define :'pl' LOCALE" do
      Polish::LOCALE.should == :'pl'
    end

    it "should provide 'locale' proxy" do
      Polish.locale.should == Polish::LOCALE
    end
  end

  describe "during i18n initialization" do
    before(:each) do
      I18n.load_path = []
    end

    after(:all) do
      Polish.init_i18n
      I18n.reload!
    end

    it "should extend the backend with I18n::Backend::Pluralization" do
      I18n.backend.class.ancestors.should include(I18n::Backend::Pluralization)
    end

    it "should keep existing translations while switching backends" do
      I18n.load_path << File.join(File.dirname(__FILE__), 'fixtures', 'en.yml')
      Polish.init_i18n
      I18n.reload!
      I18n.t(:foo, :locale => :'en').should == "bar"
    end

    it "should keep existing :pl translations while switching backends" do
      I18n.load_path << File.join(File.dirname(__FILE__), 'fixtures', 'pl.yml')
      Polish.init_i18n
      I18n.reload!
      I18n.t(:'date.formats.default', :locale => :'pl').should == "override"
    end

    it "should not change default locale" do
      locale = I18n.default_locale
      Polish.init_i18n
      I18n.default_locale.should == locale
    end
  end

  describe "with pluralization" do
    %w(p pluralize).each do |method|
      it "'#{method}' should pluralize with variants given" do
        variants = %w(dom domy domów)

        Polish.send(method, 1, *variants).should == 'dom'
        Polish.send(method, 2, *variants).should == 'domy'
        Polish.send(method, 3, *variants).should == 'domy'
        Polish.send(method, 4, *variants).should == 'domy'
        Polish.send(method, 5, *variants).should == 'domów'
        Polish.send(method, 10, *variants).should == 'domów'
        Polish.send(method, 11, *variants).should == 'domów'
        Polish.send(method, 12, *variants).should == 'domów'
        Polish.send(method, 13, *variants).should == 'domów'
        Polish.send(method, 14, *variants).should == 'domów'
        Polish.send(method, 21, *variants).should == 'domów'
        Polish.send(method, 22, *variants).should == 'domy'
        Polish.send(method, 23, *variants).should == 'domy'
        Polish.send(method, 24, *variants).should == 'domy'
        Polish.send(method, 25, *variants).should == 'domów'
        Polish.send(method, 29, *variants).should == 'domów'
        Polish.send(method, 112, *variants).should == 'domów'
        Polish.send(method, 131, *variants).should == 'domów'
        Polish.send(method, 132, *variants).should == 'domy'
        Polish.send(method, 3.14, *variants).should == 'domów'
      end

      it "should raise an exception when first parameter is not a number" do
        lambda { Polish.send(method, nil, "dom", "domy", "domów") }.should
                                                      raise_error(ArgumentError)
        lambda { Polish.send(method, "dom", "domy", "domów", "domów") }.should
                                                      raise_error(ArgumentError)
      end

      it "should raise an exception when there are not enough variants" do
        lambda { Polish.send(method, 1) }.should raise_error(ArgumentError)
        lambda { Polish.send(method, 1, "dom") }.should
                                                  raise_error(ArgumentError)
        lambda { Polish.send(method, 1, "dom", "domy") }.should
                                                  raise_error(ArgumentError)
      end
    end
  end
end
