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

  def publishd_state
    [
      %w[
        草稿 draft
      ],
      %w[
        發布 publish
      ]
    ]
  end
end
