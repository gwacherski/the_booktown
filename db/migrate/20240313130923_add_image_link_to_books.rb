class AddImageLinkToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :image_link, :string
  end
end
