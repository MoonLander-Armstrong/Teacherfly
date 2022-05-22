class Read < ApplicationRecord
  # relationship
  belongs_to :user
  belongs_to :section

  scope :to_read_sections, ->(id) { where(section_id: id) }
  after_create do |read|
    read.update(course_id: read.section.course.friendly_id)
  end

  def self.read_finished_rate(user, course)
    p (where(["finished = ? and course_id = ? and user_id = ?", true, course, user]).count.to_f / where(["course_id = ? and user_id = ?", course, user]).count* 100 ).to_i
  end
end