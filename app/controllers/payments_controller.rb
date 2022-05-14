class PaymentsController < ApplicationController

  def create
    order = order.find(1)
    @form_info = Newebpay::Mpg.new(order).form_info
  end
end
