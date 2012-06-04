class ChangeColumnNamesOfComments < ActiveRecord::Migration
  def change
    rename_column :comments, :content, :message
    rename_column :comments, :like_count, :likes
  end
end
