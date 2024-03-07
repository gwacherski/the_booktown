class Review < ApplicationRecord
  belongs_to :roteiro
  belongs_to :user
  has_rich_text :rich_body
end
