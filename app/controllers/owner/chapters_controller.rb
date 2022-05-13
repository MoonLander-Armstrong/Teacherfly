# frozen_string_literal: true

module Owner
  class ChaptersController < ApplicationController
    layout "owner"
    before_action :find_chapter, only: %i[edit update destroy]

    def index
      @course = Course.friendly.find(params[:course_id])
      @chapters = Chapter.all
    end

    def new
      @course = Course.friendly.find(params[:course_id])
      @chapter = Chapter.new
      render layout: "ID_owner"
    end

    def create
      @course = Course.friendly.find(params[:course_id])
      @chapter = @course.chapters.new(chapter_params)

      if @chapter.save
        redirect_to curriculum_owner_course_path(@course), notice: '新增成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        render :new
      end
    end

    def edit
      @course = Course.find(params[:course_id])
    end


    def update
      @course = Course.friendly.find(params[:course_id])
      if @chapter.update(chapter_params)
        redirect_to curriculum_owner_course_path(@course), notice: '新增成功'
      else
        flash.now[:alter] = '請輸入正確資訊'
        render :edit
      end
    end

    def destroy
      @course = Course.find(params[:course_id])
      @chapter.destroy
      redirect_to curriculum_owner_course_path(@course), alert: '刪除成功'
    end
    
    private
    
    def chapter_params
      params.require(:chapter).permit(:title)
    end
    
    def find_chapter
      @chapter = Chapter.friendly.find(params[:id])
    end
  end
end
