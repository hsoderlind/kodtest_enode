class Point < ApplicationRecord
  belongs_to :customer
  belongs_to :order, optional: true
  validates :allocated_points, presence: true
end
