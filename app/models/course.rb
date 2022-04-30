class Course < ApplicationRecord
    validates :title, presence: true

    has_one_attached :classImg
end
