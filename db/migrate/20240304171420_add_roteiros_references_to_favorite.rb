class AddRoteirosReferencesToFavorite < ActiveRecord::Migration[7.1]
  def change
    add_reference :favorites, :roteiro, null: false, foreign_key: true
  end
end
