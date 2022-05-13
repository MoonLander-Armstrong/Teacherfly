# frozen_string_literal: true

class SectionsController < ApplicationController
  layout "section"

  def show
    # render html: params
    @user = current_user
    @course = Course.friendly.find(params[:course_id])
    @section = Section.friendly.find(params[:id])
    @chapter = @section.chapter
  end
end
