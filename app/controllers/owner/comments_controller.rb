class Owner::CommentsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:section_id])
    @comment = @section.comments.new(comment_params)
    if @comment.save
      redirect_to comments_owner_course_path(@course), notice: "新增留言成功!"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id).merge(user: current_user, course: @course)
  end
end