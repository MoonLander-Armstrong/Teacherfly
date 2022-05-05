class Course < ApplicationRecord
  validates :title, presence: true
  # relationship
  has_one_attached :classImg

  belongs_to :user
  has_many :chapters
end
