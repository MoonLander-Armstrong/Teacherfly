class Api::V1::SectionsController < ApplicationController
  def finished
    read_section = current_user.reads.to_read_sections(params[:sectionId])

    if read_section.update(finished: params[:finished])
      render json: {
        message: "更新成功",
        progress: "#{Read.read_finished_rate(current_user, params[:course_id])}%",
        finished: read_section.pluck(:finished)
      }
    else
      render json: {
        message: "更新失敗",
        finished: read_section.pluck(:finished)
      }, status: 500
    end
  end
end
