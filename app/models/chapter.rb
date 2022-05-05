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
  has_many :sections, dependent: :delete_all

  def self.qwe(aa)
    aa.sections.each do |section|
      section.media.purge_later
    end
  end
end
