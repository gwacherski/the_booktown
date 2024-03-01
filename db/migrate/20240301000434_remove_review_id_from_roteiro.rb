class RemoveReviewIdFromRoteiro < ActiveRecord::Migration[7.1]
  def change
    remove_index :roteiros, name: "index_roteiros_on_review_id"
  end
end
