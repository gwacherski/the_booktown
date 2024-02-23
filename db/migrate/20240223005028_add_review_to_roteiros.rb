class AddReviewToRoteiros < ActiveRecord::Migration[7.1]
  def change
    add_reference :roteiros, :review, null: false, foreign_key: true
  end
end
