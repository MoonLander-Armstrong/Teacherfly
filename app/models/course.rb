class Course < ApplicationRecord
  include Slugable

  # validates
  validates :title, presence: true
  validates :description, length: { maximum: 50 }

  # relationship
  belongs_to :user
  belongs_to :lecturer
  has_one_attached :classImg
  has_many :chapters, dependent: :destroy
  has_many :sections, through: :chapters
  has_many :comments
  has_many :orders

  # scope
  scope :published, -> { where(published: "publish") }
  scope :draft, -> { where(published: "draft") }

  # callbacks
  after_find do |course|
    course.price ||= 0
  end

  def all_published_sections
    sections.published
  end

  def section_finished_rate
    (all_published_sections.select{ |section| section.finished }.count.to_f / all_published_sections.count * 100).to_i
  end
end
