class HelloController < ApplicationController
  def hello
    render html: params["str"].reverse
  end

  def chars_recognize
    resp = ""

    if params["str"].present?
      chars = params["str"].split("")
      resp = {
        lowerCase: chars.select { |x| /[[:lower:]]/.match(x) },
        upperCase: chars.select { |x| /[[:upper:]]/.match(x) },
        digits: chars.select { |x| /[\d]/.match(x) },
      }
    end

    render json: {
      charsTypes: resp,
      errors: [
        params["str"].nil? ? "No parameters given" : ""
      ].reject(&:blank?)
    }
  end

  # def type_check
  #   resp = ""
  #
  #   if params["str"].present?
  #     resp = "String"
  #     resp = "Char" if params["str"].size == 1
  #     resp = "Number" if is_number?(params["str"])
  #   end
  #
  #   render json: {
  #     paramType: resp,
  #     errors: [
  #       resp.blank? ? "No parameters given" : ""
  #     ].reject(&:blank?)
  #   }
  # end
  #
  # def is_number?(str)
  #   true if Float(str) rescue false
  # end

end
