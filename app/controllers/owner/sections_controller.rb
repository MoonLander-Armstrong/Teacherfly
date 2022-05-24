# frozen_string_literal: true

module Owner
  class SectionsController < ApplicationController
    layout "owner"
    before_action :find_course
    before_action :find_section, only: %i[edit update destroy]
    before_action :section_policy

    def new
      @chapter = Chapter.find(params[:chapter_id])
      @section = Section.new
    end

    def create
      @chapter = @course.chapters.find(params[:chapter_id])
      @section = @chapter.sections.new(section_params)
      # @media = @section.media
      # @section.update!(media: nil)

      if @section.save 
        redirect_to curriculum_owner_course_path(@course), notice: '新增成功'
        # redirect_to root_path, notice: '新增成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        render :new
      end
    end

    def edit
    end


    def update
      @section.update(media: nil)
      if @section.update(section_params)
        redirect_to curriculum_owner_course_path(@course), notice: '新增成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        render :edit
      end
    end

    def destroy
      if @section.media
        @section.update(media: nil)
        @section.destroy
        redirect_to curriculum_owner_course_path(@course), alert: '刪除成功'
      else
        @section.destroy
        redirect_to curriculum_owner_course_path(@course), alert: '刪除成功'
      end
    end
    
    private
    
    def section_params
      params.require(:section).permit(:title, :content, :published, :finished, :media)
    end
    
    def find_section
      @section = Section.find(params[:id])
    end

    def find_course
      @course = current_user.courses.find(params[:course_id])
    end

    def section_policy
      authorize @course, policy_class:
      SectionPolicy
    end
  end
end
