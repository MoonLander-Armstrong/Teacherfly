# frozen_string_literal: true

module Owner
  class ChaptersController < ApplicationController
    before_action :find_chapter, only: %i[edit update destroy]

    def index
      @chapters = Chapter.all
    end

    def new
      @chapter = Chapter.new
    end

    def create
      @chapter = current_user.chapters.new(chapter_params)

      if @chapter.save
        redirect_to owner_chapters_path, notice: '新增成功'
      else
        flash.now[:alert] = '請輸入正確資訊'
        render :new
      end
    end

    def edit; end

    def update
      if @chapter.update(chapter_params)
        redirect_to owner_chapters_path, notice: '更新成功'
      else
        flash.now[:alter] = '請輸入正確資訊'
        render :edit
      end
    end

    def destroy
      @chapter.sections.delete_all && @chapter.destroy
      redirect_to owner_chapters_path, notice: '刪除chapter!!'
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
