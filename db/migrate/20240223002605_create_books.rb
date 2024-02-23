class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :description
      t.date :date_of_publication
      t.integer :pages_number
      t.string :genre
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
