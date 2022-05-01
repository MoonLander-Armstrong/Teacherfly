# frozen_string_literal: true

module Owner
  class SectionsController < ApplicationController
    before_action :find_section, only: %i[show edit update destroy]

    def index; end

    def new
      @section = Section.new
    end

    def create
      chapter = Chapter.find(params[:chapter_id])
      @section = chapter.sections.new(section_params)

      if @section.save
        redirect_to owner_chapters_path, notice: '新增成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        render :new
      end
    end

    def edit; end

    def update
      if @section.update(section_params)
        redirect_to owner_chapters_path, notice: '更新成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        render :edit
      end
    end

    def destroy
      if @section.media.attached?
        @section.media.purge_later
        @section.destroy
        redirect_to owner_chapters_path, notice: '刪除成功（有影片）'
      else
        @section.destroy
        redirect_to owner_chapters_path, notice: '刪除成功'
      end
    end

    def show; end

    private

    def section_params
      params.require(:section).permit(:title, :content, :published, :finished, :media)
    end

    def find_section
      chapter = Chapter.find(params[:chapter_id])
      @section = chapter.sections.find(params[:id])
    end
  end
end
