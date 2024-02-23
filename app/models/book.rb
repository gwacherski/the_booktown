class Book < ApplicationRecord
  has_many :roteiros
  belongs_to :user
end
