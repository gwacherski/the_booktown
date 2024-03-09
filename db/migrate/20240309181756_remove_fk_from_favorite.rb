class RemoveFkFromFavorite < ActiveRecord::Migration[7.1]
  def change
    remove_reference :favorites, :roteiros
  end
end
