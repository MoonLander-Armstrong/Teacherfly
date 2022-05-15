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

  # scope
  scope :published, -> { where(published: "publish") }
  scope :draft, -> { where(published: "draft") }

  # callbacks
  after_find do |course|
    course.price ||= 0
  end

  def first_section
    self.chapters.first.sections.first
  end

  def last_section
    if self.chapters.last.sections.present?
      self.chapters.last.sections.last
    else
      self.chapters.select { |c| c.sections == true 
        return c.sections.last 
      }
    end  
  end
end
