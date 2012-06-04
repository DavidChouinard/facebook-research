class AddFacebookIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :facebook_id, :bigint
  end
end
