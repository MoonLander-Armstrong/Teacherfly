# frozen_string_literal: true

class Chapter < ApplicationRecord
    # validates
    validates :title,
    presence: true,
    length: {
      maximum: 20
    }

# relationship
belongs_to :user
has_many :sections
end
