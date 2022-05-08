class Course < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 50 }
  # relationship
  has_one_attached :classImg

  belongs_to :user
  has_many :chapters, dependent: :delete_all
end
