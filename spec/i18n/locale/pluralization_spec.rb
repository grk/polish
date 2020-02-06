RSpec.describe I18n, "Polish pluralization" do
  before(:each) do
    @hash = {}
    %w(one few other).each do |key|
      @hash[key.to_sym] = key
    end
    @backend = I18n.backend
  end

  it "should pluralize correctly" do
    expect(@backend.send(:pluralize, :'pl', @hash, 1)).to eq 'one'
    expect(@backend.send(:pluralize, :'pl', @hash, 2)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 3)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 4)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 5)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 10)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 11)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 12)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 13)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 14)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 20)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 21)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 22)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 23)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 24)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 25)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 30)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 31)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 32)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 33)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 34)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 112)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 122)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 132)).to eq 'few'
    expect(@backend.send(:pluralize, :'pl', @hash, 1.31)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 2.31)).to eq 'other'
    expect(@backend.send(:pluralize, :'pl', @hash, 3.31)).to eq 'other'
  end
end
