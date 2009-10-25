require File.dirname(__FILE__) + '/../../spec_helper'
 
describe I18n, "Polish pluralization" do
  before(:each) do
    @hash = {}
    %w(one few other).each do |key|
      @hash[key.to_sym] = key
    end
    @backend = I18n.backend
  end
  
  it "should pluralize correctly" do
    @backend.send(:pluralize, :'pl', @hash, 1).should == 'one'
    @backend.send(:pluralize, :'pl', @hash, 2).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 3).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 4).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 5).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 10).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 11).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 12).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 13).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 14).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 20).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 21).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 22).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 23).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 24).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 25).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 30).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 31).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 32).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 33).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 34).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 112).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 122).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 132).should == 'few'
    @backend.send(:pluralize, :'pl', @hash, 1.31).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 2.31).should == 'other'
    @backend.send(:pluralize, :'pl', @hash, 3.31).should == 'other'
  end
end
