class Course < ApplicationRecord
  # validates
  validates :title, presence: true
  validates :description, length: { maximum: 50 }

  # relationship
  belongs_to :user
  belongs_to :lecturer
  has_one_attached :classImg
  has_many :chapters, dependent: :destroy

  def first_section
    self.chapters.first.sections.first
  end

  def last_section
    self.chapters.last.sections.last
  end
end
