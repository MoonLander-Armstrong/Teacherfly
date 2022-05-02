class SectionUploadMediaJob < ApplicationJob
  queue_as :default

  def perform(*section)
    chapter = Chapter.find(params[:chapter_id])
    @section = chapter.sections.new(section_params)
    @section.save 
  end
end
