# frozen_string_literal: true

module Owner
  class SectionsController < ApplicationController
    layout "owner"
    before_action :find_section, only: %i[show edit update destroy]

    def new
      @course = Course.find(params[:course_id])
      @chapter = Chapter.find(params[:chapter_id])
      @section = Section.new
    end

    def create
      @course = Course.find(params[:course_id])
      @chapter = @course.chapters.find(params[:chapter_id])
      @section = @chapter.sections.new(section_params)
      
      if @section.save  
        redirect_to curriculum_owner_course_path(@course), notice: '新增成功'
        #redirect_to root_path, notice: '新增成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        # render :new
      end
    end

    def edit
      @course = Course.find(params[:course_id])
    end


    def update
      @course = Course.find(params[:course_id])
      @section.media.purge_later
      if @section.update(section_params)
        redirect_to curriculum_owner_course_path(@course), notice: '新增成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        render :edit
      end
    end

    def destroy
      course = Course.find(params[:course_id])
      if @section.media.attached?
        @section.media.purge_later 
        @section.destroy
        redirect_to curriculum_owner_course_path(course), alert: '刪除成功'
      else
        @section.destroy
        redirect_to curriculum_owner_course_path(course), alert: '刪除成功'
      end
    end
    
    private
    
    def section_params
      params.require(:section).permit(:title, :content, :published, :finished, :media)
    end
    
    def find_section
      @section = Section.find(params[:id])
    end
  end
end
