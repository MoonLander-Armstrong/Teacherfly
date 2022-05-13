# frozen_string_literal: true

class SectionsController < ApplicationController
  layout "section"

  def show
    # render html: params
    @user = current_user
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
    @chapter = @section.chapter
  end
end
