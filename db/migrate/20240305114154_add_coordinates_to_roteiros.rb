class AddCoordinatesToRoteiros < ActiveRecord::Migration[7.1]
  def change
    add_column :roteiros, :latitude, :float
    add_column :roteiros, :longitude, :float
  end
end
