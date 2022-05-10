class CourseLecturer < ApplicationRecord
  belongs_to :course
  belongs_to :lecturer
end
