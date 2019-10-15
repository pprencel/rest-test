class CharsController < ApplicationController

  def chars_recognize
    resp = ""

    if params["str"].present?
      chars = params["str"].split("")
      resp = {
        lowerCase: chars.select { |c| /[[:lower:]]/.match(c) },
        upperCase: chars.select { |c| /[[:upper:]]/.match(c) },
        digits: chars.select { |c| /[\d]/.match(c) },
        special: chars.select { |c| /[_@?¿!#$%^&*=+€-]/.match(c) },
      }
    end

    render json: {
      charsTypes: resp,
      errors: [
        params["str"].nil? ? "No parameters given" : ""
      ].reject(&:blank?)
    }
  end

end
