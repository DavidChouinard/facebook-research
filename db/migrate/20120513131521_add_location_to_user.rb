class AddLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :location_id, :integer
    add_column :users, :location_name, :string
    add_column :users, :gender, :string
    add_column :users, :timezone, :float
    add_column :users, :locale, :string
  end
end
