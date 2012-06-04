class AddFriendsOfToUsers < ActiveRecord::Migration
  def change
    add_column :users, :friend_of, :bigint
  end
end
