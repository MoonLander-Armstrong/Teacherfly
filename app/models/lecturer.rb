class Lecturer < ApplicationRecord
    validates :name, presence: true
    
    has_one_attached :mugshot

    has_many :course_lecturers
    has_many :courses, through: :course_lecturers
end
