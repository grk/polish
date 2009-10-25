require File.dirname(__FILE__) + '/spec_helper'
 
describe Polish, "VERSION" do
  it "should be defined" do
    %w(MAJOR MINOR TINY STRING).each do |v|
      Polish::VERSION.const_defined?(v).should == true
    end
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
  
  describe "with custom backend class" do
    it "should define i18n_backend_class" do
      Polish.i18n_backend_class.should == I18n::Backend::Advanced
    end
  end
  
  describe "during i18n initialization" do
    after(:each) do
      I18n.load_path = []
      Polish.init_i18n
    end
 
    it "should set I18n backend to an instance of a custom backend" do
      Polish.init_i18n
      I18n.backend.class.should == Polish.i18n_backend_class
    end
    
    it "should keep existing translations while switching backends" do
      I18n.load_path << File.join(File.dirname(__FILE__), 'fixtures', 'en.yml')
      Polish.init_i18n
      I18n.t(:foo, :locale => :'en').should == "bar"
    end
    
    it "should keep existing :pl translations while switching backends" do
      I18n.load_path << File.join(File.dirname(__FILE__), 'fixtures', 'pl.yml')
      Polish.init_i18n
      I18n.t(:'date.formats.default', :locale => :'pl').should == "override"
    end
    
    it "should set default locale to Polish locale" do
      Polish.init_i18n
      I18n.default_locale.should == Polish.locale
    end
  end
  
  describe "with localize proxy" do
    before(:all) do
      @time = mock(:time)
      @options = { :format => "%d %B %Y" }
    end
    
    %w(l localize).each do |method|
      it "'#{method}' should call I18n backend localize" do
        I18n.should_receive(:localize).with(@time, @options.merge({ :locale => Polish.locale }))
        Polish.send(method, @time, @options)
      end
    end
  end
  
  describe "with translate proxy" do
    before(:all) do
      @object = :bar
      @options = { :scope => :foo }
    end
 
    %w(t translate).each do |method|
      it "'#{method}' should call I18n backend translate" do
        I18n.should_receive(:translate).with(@object, @options.merge({ :locale => Polish.locale }))
        Polish.send(method, @object, @options)
      end
    end
  end
  
  describe "strftime" do
    before(:all) do
      @time = mock(:time)
    end
 
    it "should call localize with object and format" do
      format = "%d %B %Y"
      Polish.should_receive(:localize).with(@time, { :format => format })
      Polish.strftime(@time, format)
    end
    
    it "should call localize with object and default format when format is not specified" do
      Polish.should_receive(:localize).with(@time, { :format => :default })
      Polish.strftime(@time)
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
        lambda { Polish.send(method, nil, "dom", "domy", "domów") }.should raise_error(ArgumentError)
        lambda { Polish.send(method, "dom", "domy", "domów", "domów") }.should raise_error(ArgumentError)
      end
      
      it "should raise an exception when there are not enough variants" do
        lambda { Polish.send(method, 1) }.should raise_error(ArgumentError)
        lambda { Polish.send(method, 1, "dom") }.should raise_error(ArgumentError)
        lambda { Polish.send(method, 1, "dom", "domy") }.should raise_error(ArgumentError)
      end
    end
  end
end