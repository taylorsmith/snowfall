require 'spec_helper'

describe Snowfall::Report, '.new' do
  it 'configures the report settings' do
    colorado = Snowfall::Report.new 'Colorado'
    colorado.state.should eq 'Colorado'
    colorado.url.should eq 'http://www.onthesnow.com/colorado/snow-rss.html'
  end
end

describe Snowfall::Report, '#resorts' do
  it 'returns an array of resorts' do
    VCR.use_cassette('colorado') do
      colorado = Snowfall::Report.new 'Colorado'
      colorado.resorts.count.should eq 23
    end
  end
end

