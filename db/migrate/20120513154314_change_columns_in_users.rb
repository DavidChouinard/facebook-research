class ChangeColumnsInUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :relationship_status, :string
    remove_column :users, :timezone
    remove_column :users, :location_id
    remove_column :users, :location_name
  end
end
