# frozen_string_literal: true

class Section < ApplicationRecord
  has_one_attached :media, dependent: :destroy

  # validates
  validates :title,
            presence: true,
            length: {
              maximum: 30
            }

  # relationship
  belongs_to :chapter

  def self.published_state
    [
      %w[
        草稿 draft
      ],
      %w[
        發布 publish
      ]
    ]
  end

  def prev_section
    if chapter.sections.where("id < ?", id).last.nil?
      chapter.prev_chapter.sections.last
    else
      chapter.sections.where("id < ?", id).last
    end
  end

  def next_section
    if chapter.sections.where("id > ?", id).first.nil?
      chapter.next_chapter.sections.first
    else
      chapter.sections.where("id > ?", id).first
    end
  end
end
