class RemoveRoteiroIdFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :roteiro_id, :bigint
  end
end
