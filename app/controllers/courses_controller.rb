# frozen_string_literal: true

class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
  end
  
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
		if @course.save
			flash[:notice] = "新增成功!"
			redirect_to "/courses"
		else
			render :new
		end
  end

  def edit
    @course = Course.find_by(id: params[:id])
  end

  def update
    @course = Course.find_by(id: params[:id])
		if @course.update(course_params)
			flash[:notice] = "更新成功!"
			redirect_to "/courses"
		else
			render :edit
		end
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy

    flash[:notice] = "刪除成功"
    redirect_to "/courses"
  end



  private
    def course_params
      params.require(:course).permit(:title, :content, :price, :status)
    end
end
