class OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: %i[payment_response] #忽略外部網址 CSRF

  def index
    @orders = Order.all
  end

  def payment_response
    response = Newebpay::MpgResponse.new(params[:TradeInfo])
    render html: response.result
  end


  def payment
    @order = current_user.orders.new
    @course = Course.friendly.find(params[:course_id])
    order = @course
    @form_info = Newebpay::Mpg.new(order).form_info
  end

end
