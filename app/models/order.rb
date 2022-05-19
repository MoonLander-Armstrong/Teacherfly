class Order < ApplicationRecord
  include AASM
  include Slugable

  aasm column: "status" do
    state :panding, initial: true
    state :completed

    event :pay do
      transitions from: :pending, to: :paid
    end

  end

  # relationship
  belongs_to :course
  belongs_to :user
end
