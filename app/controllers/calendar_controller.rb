require 'rest-client'

class CalendarController < ApplicationController

  def weeia
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
      date = Date.strptime("#{day}-#{month}-#{year}", '%e-%m-%Y').to_s
      resp << {text: text, date: date}
    end

    binding.pry
    render json: resp

  end
end
