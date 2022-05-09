class Lecturer < ApplicationRecord
    validates :name, presence: true
    # relationship
    has_one_attached :mugshot
end
