class Course < ApplicationRecord
    validates :title, presence: true

    # relationship
    has_one_attached :classImg
end
