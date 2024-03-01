class AddRoteiroIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :roteiro, null: false, foreign_key: true
  end
end
