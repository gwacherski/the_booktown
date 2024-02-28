class AddFieldsToRoteiros < ActiveRecord::Migration[7.1]
  def change
    add_column :roteiros, :title, :string, null: false
    add_column :roteiros, :activity_description, :string, null: false
    add_column :roteiros, :activity_address, :string, null: false
    add_column :roteiros, :estimated_time, :decimal, default: 0
    add_column :roteiros, :estimated_costs, :decimal, default: 0
    add_column :roteiros, :activity_done, :boolean, default: false
  end
end
