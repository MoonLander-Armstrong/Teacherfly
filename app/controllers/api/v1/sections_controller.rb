class Api::V1::SectionsController < ApplicationController
  def finished
    course = Course.find(params[:course_id])
    section = Section.find(params[:id])

    if section.update(finished: params[:finished])
      render json: {
        message: "更新成功",
        progress: "#{course.section_finished_rate}%",
        finished: section.finished
      }
    else
      render json: {
        message: "更新失敗",
        finished: section.finished
      }, status: 404
    end
  end
end
