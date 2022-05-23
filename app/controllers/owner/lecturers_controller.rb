# frozen_string_literal: true

class Owner::LecturersController < ApplicationController
  layout "owner"
  before_action :find_lecturer, only:[:edit, :update, :destroy]

  def index
    @lecturers = Lecturer.all
  end

  def new
    @lecturer = Lecturer.new
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)
    if @lecturer.save
      redirect_to owner_lecturers_path, notice: "新增成功"
    else
      flash.now[:alert] = "請輸入正確資訊"
      render :new
    end
  end

  def edit; end

  def update
    if @lecturer.update(lecturer_params)
      redirect_to owner_lecturers_path, notice: "更新成功"
    else
      flash.now[:alert] = "請輸入正確資訊"
      render :edit
    end
  end

  def destroy
    if @lecturer.mugshot
      @lecturer.update(mugshot: nil) && @lecturer.destroy
    end

    @lecturer.destroy
    redirect_to owner_lecturers_path, alter: "刪除成功！"
  end

  private

  def lecturer_params
    params.require(:lecturer).permit(:name, :nickname, :content, :mugshot)
  end

  def find_lecturer
    @lecturer = Lecturer.find(params[:id])
  end
end
