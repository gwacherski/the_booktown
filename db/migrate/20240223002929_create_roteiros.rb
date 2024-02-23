class CreateRoteiros < ActiveRecord::Migration[7.1]
  def change
    create_table :roteiros do |t|
      t.string :description
      t.string :author
      t.string :location
      t.decimal :rating


      t.timestamps
    end
  end
end
