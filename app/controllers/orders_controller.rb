class OrdersController < ApplicationController

  def index
  end

  def payment
    @form_info = Newebpay::Mpg.new.form_info
  end
end
