class Review < ApplicationRecord
  belongs_to :roteiro
  belongs_to :user
end
