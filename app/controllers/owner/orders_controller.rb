class Owner::OrdersController < ApplicationController
  layout "owner"
  def index
    @courses = current_user.courses
    @orders = Order.includes(:user).where(course: @courses, status: "paid").order(id: :desc)
  end
end
