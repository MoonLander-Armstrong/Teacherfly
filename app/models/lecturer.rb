class Lecturer < ApplicationRecord
  # validates
  validates :name, presence: true, uniqueness: true
  validates :nickname, presence: true

  # relationship
  has_one_attached :mugshot, dependent: :destroy
  has_many :courses, dependent: :destroy
end
