require 'rest-client'
require 'icalendar'

class CalendarController < ApplicationController

  def weeia
    cal = Icalendar::Calendar.new
    @feed = "http://www.weeia.p.lodz.pl/"
    month = params["month"]

    resp = []

    doc = RestClient.get(@feed)
    body = Nokogiri.HTML(doc.body)
    active = body.css('td.active')

    active.each do |cell|
      day = cell.css("a").text
      text = cell.css(".calendar-text").text
      year = Date.current.year
      cal.event do |e|
        e.dtstart     = Icalendar::Values::Date.new("#{year}#{month}#{day}")
        e.summary     = text
      end
    end

    render plain: cal.to_ical
  end
end
