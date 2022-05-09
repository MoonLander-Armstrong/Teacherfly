# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id: params[:id])
  end

  private

    def course_params
      params.require(:course).permit(:title, :content, :price, :status, :description,  :classImg)
    end
end
