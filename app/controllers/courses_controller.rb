# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.published
  end

  def show
    @course = Course.find(params[:id])
    @lecturer = @course.lecturer
  end

  private

  def course_params
    params.require(:course).permit(:title, :content, :price, :published, :description,  :classImg)
  end
end
