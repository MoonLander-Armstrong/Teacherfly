class Lecturer < ApplicationRecord
	validates :name, presence: true
	
	has_one_attached :mugshot, dependent: :destroy

	has_many :courses, dependent: :delete_all


end
