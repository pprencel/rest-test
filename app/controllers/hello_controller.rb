class HelloController < ApplicationController

  def rev_test
    value = params["str"].try(&:reverse)
    render json: { reverseValue: value }
  end

end
