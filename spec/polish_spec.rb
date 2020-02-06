RSpec.describe Polish, "VERSION" do
  it "should be defined" do
    expect(Polish::VERSION).to be_a(String)
  end
end

RSpec.describe Polish do
  describe "with locale" do
    it "should define :'pl' LOCALE" do
      expect(Polish::LOCALE).to eq :'pl'
    end

    it "should provide 'locale' proxy" do
      expect(Polish.locale).to eq Polish::LOCALE
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
      expect(I18n.backend.class.ancestors).to include(I18n::Backend::Pluralization)
    end

    it "should keep existing translations while switching backends" do
      I18n.load_path << File.join(File.dirname(__FILE__), 'fixtures', 'en.yml')
      Polish.init_i18n
      I18n.reload!
      expect(I18n.t(:foo, :locale => :'en')).to eq "bar"
    end

    it "should keep existing :pl translations while switching backends" do
      I18n.load_path << File.join(File.dirname(__FILE__), 'fixtures', 'pl.yml')
      Polish.init_i18n
      I18n.reload!
      expect(I18n.t(:'date.formats.default', :locale => :'pl')).to eq "override"
    end

    it "should not change default locale" do
      locale = I18n.default_locale
      Polish.init_i18n
      expect(I18n.default_locale).to eq locale
    end
  end

  describe "with pluralization" do
    %w(p pluralize).each do |method|
      it "'#{method}' should pluralize with variants given" do
        variants = %w(dom domy domów)

        expect(Polish.send(method, 1, *variants)).to eq 'dom'
        expect(Polish.send(method, 2, *variants)).to eq 'domy'
        expect(Polish.send(method, 3, *variants)).to eq 'domy'
        expect(Polish.send(method, 4, *variants)).to eq 'domy'
        expect(Polish.send(method, 5, *variants)).to eq 'domów'
        expect(Polish.send(method, 10, *variants)).to eq 'domów'
        expect(Polish.send(method, 11, *variants)).to eq 'domów'
        expect(Polish.send(method, 12, *variants)).to eq 'domów'
        expect(Polish.send(method, 13, *variants)).to eq 'domów'
        expect(Polish.send(method, 14, *variants)).to eq 'domów'
        expect(Polish.send(method, 21, *variants)).to eq 'domów'
        expect(Polish.send(method, 22, *variants)).to eq 'domy'
        expect(Polish.send(method, 23, *variants)).to eq 'domy'
        expect(Polish.send(method, 24, *variants)).to eq 'domy'
        expect(Polish.send(method, 25, *variants)).to eq 'domów'
        expect(Polish.send(method, 29, *variants)).to eq 'domów'
        expect(Polish.send(method, 112, *variants)).to eq 'domów'
        expect(Polish.send(method, 131, *variants)).to eq 'domów'
        expect(Polish.send(method, 132, *variants)).to eq 'domy'
        expect(Polish.send(method, 3.14, *variants)).to eq 'domów'
      end

      it "should raise an exception when first parameter is not a number" do
        expect {
          Polish.send(method, nil, "dom", "domy", "domów")
        }.to raise_error(ArgumentError)
        expect {
          Polish.send(method, "dom", "domy", "domów", "domów")
        }.to raise_error(ArgumentError)
      end

      it "should raise an exception when there are not enough variants" do
        expect { Polish.send(method, 1) }.to raise_error(ArgumentError)
        expect { Polish.send(method, 1, "dom") }.to raise_error(ArgumentError)
        expect { Polish.send(method, 1, "dom", "domy") }.to raise_error(ArgumentError)
      end
    end
  end
end
