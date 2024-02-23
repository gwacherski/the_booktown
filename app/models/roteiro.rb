class Roteiro < ApplicationRecord
  has_many :reviews
  belongs_to :book
end
