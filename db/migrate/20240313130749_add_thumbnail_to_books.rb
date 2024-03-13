class AddThumbnailToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :thumbnail, :string
  end
end
