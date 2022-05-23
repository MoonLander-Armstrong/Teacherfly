class Course < ApplicationRecord
  include Slugable
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute

  # validates
  validates :title, presence: true
  validates :price, presence: true
  validates :published, presence: true
  validates :description, length: { maximum: 50 }

  # relationship
  belongs_to :user
  belongs_to :lecturer
  has_many :chapters, dependent: :destroy
  has_many :sections, through: :chapters
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :buyers, through: :orders, source: :user

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
end
