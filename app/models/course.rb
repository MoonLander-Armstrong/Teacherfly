class Course < ApplicationRecord
  include Slugable

  # validates
  validates :title, presence: true
  validates :description, length: { maximum: 50 }

  # relationship
  has_one_attached :classImg
  belongs_to :user
  belongs_to :lecturer
  has_one_attached :classImg
  has_many :chapters, dependent: :destroy
  belongs_to :lecturer

  # scope
  scope :published, -> { where(published: "publish") }
  scope :draft, -> { where(published: "draft") }

  def first_section
    self.chapters.first.sections.first
  end

  def last_section
    self.chapters.last.sections.last
  end
end
