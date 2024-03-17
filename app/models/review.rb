class Review < ApplicationRecord
  belongs_to :roteiro
  belongs_to :user

  has_many_attached :photos
end
