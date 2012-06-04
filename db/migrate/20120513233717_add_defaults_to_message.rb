class AddDefaultsToMessage < ActiveRecord::Migration
  def change
    change_column_default :messages, :tag_count, 0
    change_column_default :messages, :like_count, 0
    change_column_default :messages, :comment_count, 0
  end
end
