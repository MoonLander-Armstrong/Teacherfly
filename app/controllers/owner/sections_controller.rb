class Owner::SectionsController < ApplicationController
  before_action :find_section, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @section = Section.new
  end

  def create
    chapter = Chapter.find(params[:chapter_id])
    @section = chapter.sections.new(section_params)

    if @section.save
      redirect_to owner_chapters_path, notice: "新增成功"
    else
      flash.now[:alert] = "請輸入正確資訊"
      render :new
    end
  end

  def edit
  end

  def update
    if @section.update(section_params)
      redirect_to owner_chapters_path, notice: "更新成功"
    else
      flash.now[:alert] = "請輸入正確資訊"
      render :edit
    end
  end

  def destroy
    @section.destroy
  end
  
  private

  def section_params
    params.require(:section).permit(:title, :content, :published, :finished)
  end

  def find_section
    chapter = Chapter.find(params[:chapter_id])
    @section = chapter.sections.find(params[:id])
  end
end