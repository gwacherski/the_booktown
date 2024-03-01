class RemoveReviewReferences < ActiveRecord::Migration[7.1]
  def change
    remove_reference :roteiros, :review, null: false, foreign_key: true
  end
end
