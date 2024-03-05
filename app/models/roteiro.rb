class Roteiro < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :book

  has_many_attached :photos

  # validates :description, presence: true
  validates :author, presence: true
  validates :location, presence: true
  # validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :title, presence: true
  validates :activity_description, presence: true
  validates :activity_address, presence: true
  validates :estimated_time, numericality: { greater_than_or_equal_to: 0 }
  validates :estimated_costs, numericality: { greater_than_or_equal_to: 0 }
  validates :activity_done, inclusion: { in: [true, false] }

  attr_accessor :remove_photo

  before_save :check_for_photo_removal

  def check_for_photo_removal
    puts "Checking for photo removal"
    photo.purge if remove_photo == '1'
  end

end
