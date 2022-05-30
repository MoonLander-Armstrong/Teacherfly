class Owner::UsersController < ApplicationController
  layout "owner"
  before_action :find_user, only: [:information, :update]

  def index
    authorize :user
    @users = current_user.students.ordered
  end

  def information
    authorize :user
  end

  def subscription
    @order = @user.orders.new(state: "paid")
    if @order.save
      redirect_to 
    else
    end

  end


  def update
    authorize :user
    if @user.update(user_params)
      flash.now[:notice] = "成功更新學生資料"
      redirect_to information_owner_user_path(@user)
    else
      flash.now[:alert] = "請輸入正確資訊"
      render :information
    end
  end

  def create
    @user = current_user.students.new(user_params)
    if @user.save
      redirect_to owner_users_path, notice:  "成功新增學生資料"
    else
      redirect_to owner_users_path  
      flash.now[:notice] = "XXXXXXXXXXXX"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :avatar, :password)
  end

  def find_user
    @user = current_user.students.find(params[:id])
  end
end
