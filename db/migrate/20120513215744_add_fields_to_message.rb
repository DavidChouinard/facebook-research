class AddFieldsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :from, :bigint
    add_column :messages, :to, :bigint
    add_column :messages, :type, :string
    add_column :messages, :tag_count, :integer
    add_column :messages, :like_count, :integer
    add_column :messages, :comment_count, :integer
    add_column :messages, :facebook_created_time, :timestamp
    add_column :messages, :facebook_update_time, :timestamp
  end
end
