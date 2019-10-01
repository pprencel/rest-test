class HelloController < ApplicationController
  def hello
    render html: params["str"].reverse
  end
end
