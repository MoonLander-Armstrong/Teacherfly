class CommentsController < ApplicationController
  def create
    @course = Course.friendly.find(params[:course_id])
    @section = Section.find(params[:section_id])
    @comment = @section.comments.new(comment_params)
    if @comment.save
      redirect_to course_section_path(@course, @section)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id).merge(user: current_user)
  end
end
