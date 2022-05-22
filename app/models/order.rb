class Order < ApplicationRecord
  include AASM
  include Slugable

  aasm column: "status" do
    state :pending, initial: true
    state :paid

    event :pay do
      transitions from: :pending, to: :paid
    end
  end

  # relationship
  belongs_to :course
  belongs_to :user

  # scopes
  scope :bought_course, ->(course) { where(["status = ? and course_id = ?", "paid", course]) }

  # callbacks
  after_update :add_users_to_reads, if: :paid?

  def add_users_to_reads
    user.to_reads << course.all_published_sections
  end
end
