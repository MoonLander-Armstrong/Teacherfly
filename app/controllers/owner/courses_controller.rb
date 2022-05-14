# frozen_string_literal: true
module Owner
  class CoursesController < ApplicationController
    layout "owner"
    before_action :find_course, only:[:update, :destroy]

    def index
      @courses = Course.all
    end

    def new
      @course = current_user.courses.new
    end

    def create
      lecturer = Lecturer.find_or_create_by(name: current_user.username)
      @course = lecturer.courses.new(course_params)
      if @course.save
        redirect_to owner_courses_path, notice: "新增成功！"
      else
        render :new
      end
    end

    def update
      @lecturer = Lecturer.find_by(id: params[:lecturer_id])
      if @course.update(course_params)
        redirect_to owner_courses_path, notice: "更新成功！"
      else
        render :information
      end
    end

    def destroy
      if @course.classImg.attached? 
        @course.classImg.purge_later 
        @course.destroy
      else
        @course.destroy
      end
      redirect_to owner_courses_path, alert: "刪除成功！"
    end

    def information
      @course = Course.find(params[:id])
    end

    def curriculum
      @course = Course.find(params[:id])
      @chapters = @course.chapters
    end

    private

      def find_course
        @course = Course.find(params[:id])
      end

      def course_params
        params.require(:course).permit(:title, :content, :price, :published, :description, :classImg, :lecturer_id).merge(user_id: current_user.id)
      end
  end
end
