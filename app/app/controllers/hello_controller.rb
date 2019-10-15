class HelloController < ApplicationController
  def hello
    render html: params["str"].reverse
  end

  def type_check
    resp = "No parameter given"

    if params["str"].present?
      resp = "String"
      resp = "Char" if params["str"].size == 1
      resp = "Number" if is_number?(params["str"])
    end

    render html: resp
  end

  def is_number?(str)
    true if Float(str) rescue false
  end

end
