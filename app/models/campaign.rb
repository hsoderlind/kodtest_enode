class Campaign < ApplicationRecord
  validates :name, presence: true
  validates :points, presence: true, numericality: { only_integer: true }
  validates :category_id, presence: true
end
