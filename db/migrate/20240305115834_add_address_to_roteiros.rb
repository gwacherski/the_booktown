class AddAddressToRoteiros < ActiveRecord::Migration[7.1]
  def change
    add_column :roteiros, :address, :string
  end
end
