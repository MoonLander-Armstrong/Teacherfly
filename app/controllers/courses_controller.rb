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


  private
    def course_params
      params.require(:course).permit(:title, :content, :price, :status)
    end
end
