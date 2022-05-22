# frozen_string_literal: true

class SectionsController < ApplicationController
  layout "section"

  def show
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
    @rate = Read.read_finished_rate(current_user, params[:course_id])
  end
end
