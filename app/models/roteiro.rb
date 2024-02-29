class Roteiro < ApplicationRecord
  has_many :reviews
  belongs_to :book

  validates :description, presence: true
  validates :author, presence: true
  validates :location, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :title, presence: true
  validates :activity_description, presence: true
  validates :activity_address, presence: true
  validates :estimated_time, numericality: { greater_than_or_equal_to: 0 }
  validates :estimated_costs, numericality: { greater_than_or_equal_to: 0 }
  validates :activity_done, inclusion: { in: [true, false] }

end
