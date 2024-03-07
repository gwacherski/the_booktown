class Book < ApplicationRecord
  has_many :roteiros, dependent: :destroy
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    using: {
      tsearch: { prefix: true, any_word: true }
    }

end
