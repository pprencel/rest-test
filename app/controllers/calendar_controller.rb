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
    cal.publish

    send_data cal.to_ical, type: 'text/calendar', disposition: 'attachment', filename: "weeia_calendar-#{month}-2019.ics"
  end
end
