class RemoveActivityAddressFromRoteiro < ActiveRecord::Migration[7.1]
  def change
    remove_column :roteiros, :activity_address, :string
  end
end
