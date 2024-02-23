class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :description
      t.decimal :rating
      t.string :created_by

      t.timestamps
    end
  end
end
