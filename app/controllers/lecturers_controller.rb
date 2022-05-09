class LecturersController < ApplicationController

    before_action :find_lecturer, only:[:edit, :destroy, :update]
    def index
        @lecturers = Lecturer.all
    end

    def new
        @lecturer = Lecturer.new
    end

    def create
        @lecturer = Lecturer.new(lecturer_params)
        if @lecturer.save
            redirect_to "/lecturers", notice: "新增成功"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @lecturer.update(lecturer_params)
            redirect_to "/lecturers", notice: "更新成功"
        else
            render :edit
        end
    end

    def destroy
        if @lecturer.mugshot.attached?
            @lecturer.mugshot.purge_later 
            @lecturer.destroy
          else
            @lecturer.destroy
          end
          redirect_to "/lecturers", notice: "刪除成功！"
    end



    private
        def find_lecturer
            @lecturer = Lecturer.find_by(id: params[:id])
        end

        def lecturer_params
            params.require(:lecturer).permit(:name, :content, :headshot, :mugshot)
        end
end


