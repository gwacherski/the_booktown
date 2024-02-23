class AddRoteiroToBooks < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :roteiro, null: false, foreign_key: true
  end
end
