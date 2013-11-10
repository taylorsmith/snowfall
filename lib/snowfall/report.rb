require 'nokogiri'
require 'open-uri'
require 'ostruct'

module Snowfall
  class Report
    attr_accessor :state, :url

    def initialize state
      self.state = state
      self.url   = format_url state
    end

    def resorts
      Nokogiri::HTML(open(url)).xpath('//rss/channel/item').map do |i|
        OpenStruct.new({
          name:       i.xpath('title').text,
          updated:    i.xpath('pubdate').text,
          status:     i.xpath('open_staus').text,
          conditions: i.xpath('surface_condition').text,

          base: {
            depth:    i.xpath('base_depth').text,
            metric:   i.xpath('base_depth_metric').text
          },

          snowfall: {
            amount:   i.xpath('snowfall_48hr').text,
            metric:   i.xpath('snowfall_48hr_metric').text
          }
        })
      end
    end

    private

    def format_url state
      "http://www.onthesnow.com/#{state.downcase.strip.gsub(' ', '-')}/snow-rss.html"
    end
  end
end

