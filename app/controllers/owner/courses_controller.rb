# frozen_string_literal: true
module Owner
  class CoursesController < ApplicationController
    
    before_action :find_course, only:[:show, :edit, :update, :destroy]

    def index
      @courses = Course.all
    end

    def show
    end
    
    def new
      @course = Course.new
    end

    def create 
      @course = current_user.courses.new(course_params)
      if @course.save
        redirect_to owner_courses_path, notice: "新增成功！"
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @course.update(course_params)
        redirect_to owner_courses_path, notice: "更新成功！"
      else
        render :edit
      end
    end

    def destroy
      if @course.classImg.attached?
        @course.classImg.purge_later
        @course.destroy
      else
        @course.destroy
      end
      redirect_to owner_courses_path, notice: "刪除成功！"
    end



    private
      def find_course
        @course = Course.find_by(id: params[:id])
      end

      def course_params
        params.require(:course).permit(:title, :content, :price, :status, :classImg).merge(user_id: current_user.id)
      end
  end
end