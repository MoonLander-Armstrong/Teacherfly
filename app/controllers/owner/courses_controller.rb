# frozen_string_literal: true
module Owner
  class CoursesController < ApplicationController
    layout "owner"
    before_action :find_course, only:[:update, :destroy, :information, :curriculum, :comments]
    before_action :course_policy, only:[:update, :destroy, :information, :curriculum, :comments]

    def index
      authorize :course
      @courses = current_user.courses.order(id: :asc)
    end

    def new
      authorize :course
      @course = current_user.courses.new
      Lecturer.find_or_create_by(name: current_user.username)
    end

    def create
      authorize :course
      lecturer = Lecturer.find(params[:course][:lecturer_id])
      @course = lecturer.courses.new(course_params)
      if @course.save
        redirect_to curriculum_owner_course_path(@course), notice: "新增成功！"
      else
        render :new
      end
    end

    def update

      if @course.update(course_params)
        redirect_to owner_courses_path, notice: "更新成功！"
      else
        render :information
      end
    end

    def destroy
      if @course.image.attached?
        @course.image.purge
        @course.destroy
      else
        @course.destroy
      end
      redirect_to owner_courses_path, alert: "刪除成功！"
    end

    def curriculum
      @chapters = @course.chapters
    end

    def information; end

    def comments; end

    private

    def find_course
      @course = Course.includes(:chapters, :sections, :comments).find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :content, :price, :published, :description, :image, :lecturer_id).merge(user_id: current_user.id)
    end

    def course_policy
      authorize @course, policy_class: CoursePolicy 
    end
  end
end
