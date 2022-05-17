# frozen_string_literal: true

class Chapter < ApplicationRecord
  # validates
  validates :title,
            presence: true,
            length: {
              maximum: 20
            }

  # relationship
  belongs_to :course

  has_many :sections, dependent: :destroy

  def prev_chapter
    if course.chapters.where("id < ?", id).present?
      course.chapters.where("id < ?", id).last
    end
  end

  def next_chapter
    if course.chapters.where("id > ?", id).present?
      course.chapters.where("id > ?", id)
    end
  end
end
