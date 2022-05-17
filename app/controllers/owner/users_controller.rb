class Owner::UsersController < ApplicationController
  layout "owner"
  before_action :find_user, only: [:information, :update]

  def index
    @users = User.all
  end

  def information
  end

  def update
    if @user.update(user_params)
      flash.now[:notice] = "成功更新學生資料"
      redirect_to information_owner_user_path(@user)
    else
      flash.now[:alert] = "請輸入正確資訊"
      render :information
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :avatar)
  end

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
