class OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: %i[payment_response] #忽略外部網址 CSRF

  def index
    @orders = Order.all
  end

  def payment_response
    response = Newebpay::MpgResponse.new(params[:TradeInfo])
    redirect_to orders_path
  end


  def payment
    @course = Course.find(params[:course_id])
    order = @course.orders.new(name: @course.title, price:@course.price, user: current_user, email: current_user.email)

    if order.save
      @form_info = Newebpay::Mpg.new(order).form_info
    else
      render file: "#{Rails.root}/public/500.html"
    end
  end
end
