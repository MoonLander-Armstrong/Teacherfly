class Order < ApplicationRecord
  # relationship
  belongs_to :course
  belongs_to :user
end
