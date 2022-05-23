class SectionUploadMediaJob < ApplicationJob
  queue_as :default

  def perform(*section)
    @section.update(media: @media) 
  end
end
