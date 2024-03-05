class RemoveBookIdFromFavorite < ActiveRecord::Migration[7.1]
  def change
    remove_column :favorites, :book_id, :bigint
  end
end
