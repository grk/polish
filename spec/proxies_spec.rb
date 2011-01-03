# encoding: UTF-8

require File.dirname(__FILE__) + '/spec_helper'

describe "with localize proxy" do
  before(:each) do
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
  before(:each) do
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

describe "pluralize" do
  before(:all) do
    @variants = %w(dom domy domów)
    @variants_hash = {
      :one => @variants[0],
      :few => @variants[1],
      :other => @variants[2]
    }
    @count = 5
  end

  %w(p pluralize).each do |method|
    it "'#{method}' should call I18n backend pluralize" do
      I18n.backend.should_receive(:pluralize).with(Polish.locale, @variants_hash, @count)
      Polish.pluralize(@count, *@variants)            
    end
  end
end

