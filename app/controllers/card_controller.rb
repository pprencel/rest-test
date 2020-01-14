require "i18n"

class CardController < ApplicationController
  def search
    render json: { err: 'no search param' } if params['search_phrase'].nil?
    @url = "https://adm.edu.p.lodz.pl/user/users.php?search=#{params['search_phrase']}"
    doc = RestClient.get(
      @url,
      {:cookies =>
        {
          :MoodleSessionadm => "bf5b2e64d42b51fe0364d0047bde1d71",
          :wikamp_authpref => "CAS",
          :_ga => "GA1.2.1098539609.1572813695",
          :_gid =>"GA1.2.753785624.1578993918",
          :_gat => "1"
        }
      }
    )

    body = Nokogiri.HTML(doc.body)
    result = body.css('.user-info')

    @resp = []
    result.each do |contact|
      contact = Contact.find_or_initialize_by(
        name: contact.css("a").first.text,
        title: contact.css("h4").first.text,
        location: contact.css(".item-content").first.text
      )
      contact.save!
      @resp << contact
    end
  end

  def show
    respond_to do |format|
      format.vcard do
        @contact = Contact.find_by_id(params[:id])
        return if @contact.nil?
      end
    end

  end
end
