# frozen_string_literal: true

module Owner
  class ChaptersController < ApplicationController
    layout "owner"
    before_action :find_chapter, only: %i[edit update destroy]

    def index
      @chapters = Chapter.all
    end

    def new
      @chapter = Chapter.new
    end

    def create
      @course = Course.find(params[:course_id])
      @chapter = @course.chapters.new(chapter_params)

      if @chapter.save
        redirect_to edit_owner_course_path(@course), notice: '新增成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        render :new
      end
    end

    def edit; end

    def update
      @course = Course.find(params[:course_id])
      if @chapter.update(chapter_params)
        redirect_to owner_courses_path, notice: '更新成功'
      else
        flash.now[:alter] = '請輸入正確資訊'
        render :edit
      end
    end

    def destroy
      @course = Course.find(params[:course_id])
      #   #刪掉每一個section的影片
      @chapter.sections.map { |section| section.media.purge_later }

      # 刪掉Chapter裡的每個section
      @chapter.sections.delete_all 

      @course.chapters.find(params[:id]).destroy
      redirect_to edit_owner_course_path(@course), notice: '刪除chapter!!'
    end

    private

    def chapter_params
      params.require(:chapter).permit(:title)
    end

    def find_chapter
      @chapter = Chapter.find(params[:id])
    end
  end
end
